//Provides the Request service being used
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/services/firestore/CreatorRequestService.dart';
import 'package:flutter_app/services/firestore/RequestServiceBase.dart';
import 'package:flutter_app/services/firestore/UserRequestService.dart';
import 'package:flutter_app/services/notifiers/RequestServiceNotifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../AuthService.dart';
import 'AuthProvider.dart';

final AutoDisposeStateNotifierProvider<RequestServiceNotifier, RequestServiceBase>? reqServiceProv =
StateNotifierProvider.autoDispose<RequestServiceNotifier, RequestServiceBase>(
        (ref) {
      final requestServiceProvider = RequestServiceNotifier(RequestServiceInitial());

      ref.watch(authStateChangeProvider!).when(
          data: (data) {
            AuthService authService = AuthService();
            if (authService.getCurrentUser() != null) {
              if (authService.getCurrentUser()!.userRole == Role.CREATOR) {
                requestServiceProvider.setState(CreatorRequestService());
              } else {
                requestServiceProvider.setState(UserRequestService());
              }
            }
          },
          loading: () { requestServiceProvider.setState(RequestServiceInitial());},
          error: (err, stack) {
            requestServiceProvider.setState(RequestServiceInitial());
          });

      return requestServiceProvider;
    });

final AutoDisposeStreamProvider<QuerySnapshot>? reqStreamProvider =
StreamProvider.autoDispose(((ref) => ref.watch(reqServiceProv!).requestList!) as Stream<QuerySnapshot> Function(AutoDisposeProviderReference));