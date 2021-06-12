import 'dart:async';

import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/firestore/RequestServiceBase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum RequestListFilter {
  TIME_REMAINING,
  ARTIST,
  AMOUNT_PAID,
}

class RequestListService extends StateNotifier<List<Request>> {
  Timer requestUpdateTimer;
  final RequestServiceBase reqService;
  RequestListService(
      List<Request> userRequestList, RequestServiceBase reqService)
      : this.reqService = reqService,
        super(userRequestList ?? []) {
    startTimer();
  }

  void add(Request req) {
    if(state.isEmpty && req != null)
      startTimer();

    state = [...state, req];
  }

  void addAll(Iterable<Request> reqs) {
    if(state.isEmpty && reqs.isNotEmpty)
      startTimer();

    state = [...state, ...reqs];
  }

  void remove(Request req) {
    // Delete Request from firestore
    reqService.deleteRequest(req);

    state = state
        .where((listItem) => listItem.requestUuid != req.requestUuid)
        .toList();
  }

  void startTimer() {
      requestUpdateTimer = new Timer.periodic(Duration(seconds: 1), (timer) {
        if (state.isNotEmpty)
          timerTick();
        else
          timer.cancel();
      });
  }

  void timerTick() {
    final prevState = state;
    var removeList = [];
    prevState.forEach((element) {
      if (element.updateTimeRemaining()) {
        removeList.add(element);
      }
    });

    removeList.forEach((element) {
      prevState.remove(element);
      remove(element);
    });

    state = prevState;
  }

  get length => state.length;

  Request getRequestAt(int index) {
    return state[index];
  }

  void clearList() {
    state.forEach((element) {
      remove(element);
    });
    state.clear();
  }

  @override
  void dispose() {
    requestUpdateTimer.cancel();
    super.dispose();
  }
}
