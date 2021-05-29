import 'dart:async';

import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/global_resources/Constants.dart';
import 'package:flutter_app/services/firestore/CreatorRequestService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../ProvidersService.dart';

enum RequestListFilter {
  TIME_REMAINING,
  ARTIST,
  AMOUNT_PAID,
}

class RequestListService extends StateNotifier<List<Request>> {
  RequestListService(List<Request> userRequestList)
      : super(userRequestList ?? []) {
    startTimer();
  }

  void add(Request req) {
    state = [...state, req];
  }

  void addAll(Iterable<Request> reqs) {
    state = [...state, ...reqs];
  }

  void remove(Request req) {
    state = state
        .where((listItem) => listItem.requestUuid != req.requestUuid)
        .toList();

    if (state.isEmpty) {}
  }

  void removeRequestAt(int index) {}

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

      int _timeLeft = elapsedTime.inMinutes;

      if (_timeLeft <= 0) {
        remove(element);
      } else {
        element.timeRemainingMs = _timeLeft;
      }
    });
  }

  get length => state.length;

  Request getRequestAt(int index) {
    return state[index];
  }

  void clearList() {
    state.clear();
  }
}
