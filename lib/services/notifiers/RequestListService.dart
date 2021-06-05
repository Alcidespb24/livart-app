import 'dart:async';

import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/global_resources/Constants.dart';
import 'package:flutter_app/services/firestore/CreatorRequestService.dart';
import 'package:flutter_app/services/firestore/RequestServiceBase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../ProvidersService.dart';

enum RequestListFilter {
  TIME_REMAINING,
  ARTIST,
  AMOUNT_PAID,
}

class RequestListService extends StateNotifier<List<Request>> {
  final RequestServiceBase reqService;
  RequestListService(
      List<Request> userRequestList, RequestServiceBase reqService)
      : this.reqService = reqService,
        super(userRequestList ?? []) {
    startTimer();
  }

  void add(Request req) {
    state = [...state, req];
  }

  void addAll(Iterable<Request> reqs) {
    state = [...state, ...reqs];
  }

  void remove(Request req) {
    reqService.deleteRequest(req);

    state = state
        .where((listItem) => listItem.requestUuid != req.requestUuid)
        .toList();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (state.isNotEmpty) timerTick();
    });
  }

  void timerTick() {
    state.forEach((element) {
      DateTime currentTime = DateTime.now();
      Duration elapsedTime = currentTime.difference(
          DateTime.fromMillisecondsSinceEpoch(element.requestTimeMs));
      Duration timeLeft = Duration(REQUEST_TIME_OUT_MIN - elapsedTime);

      String formattedTimeLeft = DateFormat('mm:ss')
          .format(DateTime.fromMillisecondsSinceEpoch(timeLeft.inMilliseconds));

      //if (_timeLeft <= 0) {
      //remove(element);
      //} else {
      element.timeRemainingMs = formattedTimeLeft;
      // }
    });
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
}
