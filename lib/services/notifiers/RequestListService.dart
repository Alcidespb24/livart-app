import 'dart:async';

import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/global_resources/Constants.dart';
import 'package:flutter_app/services/firestore/CreatorRequestService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../ProvidersService.dart';

enum RequestListFilter{
  TIME_REMAINING,
  ARTIST,
  AMOUNT_PAID,
}

class RequestListService extends StateNotifier<List<Request>> {

  RequestListService(List<Request> userRequestList):super(userRequestList ?? []);

  void add(Request req) {
    state = [...state, req];
  }

  void addAll (Iterable<Request> reqs){
    state = [...state, ...reqs];
    updateRequestRemainingTime();
  }

  void remove(Request req) {
    state = state.where((listItem) => listItem.requestUuid != req.requestUuid)
        .toList();

    if(state.isEmpty){

    }

  }

  void removeRequestAt(int index) {
  }

  get length =>
      state.length;

  void updateRequestRemainingTime() {
    state.forEach((element) {
      Timer.periodic(Duration(seconds: 5), (timer) {
        DateTime currentTime = DateTime.now();
        Duration elapsedTime = currentTime
            .difference(
            DateTime.fromMillisecondsSinceEpoch(element.requestTimeMs));

        int _timeLeft = REQUEST_TIME_OUT_MIN - elapsedTime.inMinutes;


        if (_timeLeft < 0) {
          remove(element);
          if (state.length == 0) {
            timer.cancel();
          }
        }
        else {
          element.timeRemainingMs = _timeLeft;
        }
      });
    });
  }

  Request getRequestAt(int index) {
    return state[index];
  }

  void clearList() {
    state.clear();
  }
}