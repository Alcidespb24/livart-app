// All services should implement this class

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/Failure.dart';

enum NotifierState { INITIAL, LOADING, LOADED }

class Service {
  // Stores Failures
  Failure _failure;

  // Used to notify GUI of state changes
  NotifierState _state = NotifierState.INITIAL;

  // State Management
  NotifierState get state {
    NotifierState temp = _state;
    _state = NotifierState.INITIAL;
    return temp;
  }

  @protected
  void setState(NotifierState state) {
    _state = state;
  }

  // Failure Management
  Failure get failure {
    Failure tmp = _failure;
    _failure = null;
    return tmp;
  }

  @protected
  void setFailure(Failure failure, {id}) {
    _failure = failure;
  }

  bool hasError() {
    if (_failure != null) {
      return true;
    }
    return false;
  }
}
