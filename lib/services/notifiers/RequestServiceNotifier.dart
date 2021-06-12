import 'package:flutter_app/services/firestore/RequestServiceBase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestServiceNotifier extends StateNotifier<RequestServiceBase>{
  RequestServiceNotifier(state) : super(state);

  void setState(RequestServiceBase set){
    state = set;
  }

}

