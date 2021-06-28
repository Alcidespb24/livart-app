import 'dart:async';

import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/global_resources/Constants.dart';
import 'package:flutter_app/services/firestore/RequestServiceBase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum RequestListFilter {
  TIME_REMAINING,
  ARTIST,
  AMOUNT_PAID,
}

class RequestListService extends StateNotifier<List<Request>> {
  Timer requestUpdateTimer;
  Timer requestRecognitionAttemptTimer;
  final RequestServiceBase reqService;
  RequestListService(
      List<Request> userRequestList, RequestServiceBase reqService)
      : this.reqService = reqService,
        super(userRequestList ?? []) {
    startRequestTimeoutTimer();
  }

  void add(Request req) {
    if(state.isEmpty && req != null)
      startRequestTimeoutTimer();

    state = [...state, req];
  }

  void addAll(Iterable<Request> reqs) {
    if(state.isEmpty && reqs.isNotEmpty)
      startRequestTimeoutTimer();

    state = [...state, ...reqs];
  }

  void remove(Request req) {
    // Delete Request from firestore
    reqService.deleteRequest(req);

    state = state
        .where((listItem) => listItem.requestUuid != req.requestUuid)
        .toList();
  }

  void updateTriesLeft(Request request){
    if(state.where((listItem) => listItem.requestUuid == request.requestUuid).single.updateTriesLeft())
      remove(request);
  }

  void startRequestTimeoutTimer() {
      requestUpdateTimer = new Timer.periodic(Duration(seconds: 1), (timer) {
        if (state.isNotEmpty)
          timerTick();
        else
          timer.cancel();
      });
  }

  void timerTick() {
    final prevState = state;
  //  state.forEach((req) {
    prevState.removeWhere((element) => element.updateTimeRemaining());


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
