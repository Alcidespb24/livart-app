import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/TimerModel.dart';
import 'package:flutter_app/global_resources/Constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerNotifier extends StateNotifier<TimerModel> {
  TimerNotifier() : super(_initialState);

  static const int _initialDuration = REQUEST_TIME_OUT_MIN;
  static final _initialState =
      TimerModel(timeLeft: _initialDuration.toString(), color: Colors.green);

  final Ticker _ticker = Ticker();
  StreamSubscription<int> _tickerSubscription;

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    super.dispose();
  }

  String getTimeString(int time) {
    final minutes = ((time / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (time % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _startTimer() {
    _tickerSubscription?.cancel();

    _tickerSubscription =
        _ticker.tick(ticks: _initialDuration).listen((duration) {
      state =
          TimerModel(timeLeft: getTimeString(duration), color: Colors.green);
    });
  }
}

class Ticker {
  Stream<int> tick({@required int ticks}) {
    return Stream.periodic(
      Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
