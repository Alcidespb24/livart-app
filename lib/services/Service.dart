// All services should implement this class


import 'package:flutter_app/data_models/Failure.dart';

enum NotifierState { INITIAL, LOADING, LOADED }
class Service {
  // Stores Failures
  Failure _failure;

  // Used to notify GUI of state changes
  NotifierState _state = NotifierState.INITIAL;

  // State Management
  NotifierState get state => _state;
  void setState(NotifierState state) {
    _state = state;
  }

  // Failure Management
  Failure get failure => _failure;
  void setFailure(Failure failure) {
    _failure = failure;
  }

  bool hasError(){
    if (_failure != null){
      return true;
    }
    return false;
  }

}