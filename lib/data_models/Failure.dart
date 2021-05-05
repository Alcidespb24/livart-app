import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/EventCodeDatabase.dart';

class Failure {
  String _message;
  final EventCodes id;

  Failure({@required this.id}) {
    _message = EventCodeDatabase[id];
  }

  @override
  String toString() => _message;
}
