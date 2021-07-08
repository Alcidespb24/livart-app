import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/data_models/songDataModel.dart';
import 'package:flutter_app/services/notifiers/ACRCloudService.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/UserRequestService.dart';
import 'package:flutter_app/services/providers/RequestProvider.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/RequestList/RequestListWidget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DjDashboard extends StatefulWidget {
  static const String id = 'djDashboard_screen';

  @override
  _DjDashboardState createState() => _DjDashboardState();
}

class _DjDashboardState extends State<DjDashboard> {
  final _authService = AuthService();
  final _userRequestService = UserRequestService();

  @override
  void initState() {
    super.initState();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Position lastLocation = await Geolocator.getLastKnownPosition();
  }

  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    var header = Text(
      'Requests',
      style: TextStyle(color: Colors.white, fontSize: 35),
    );
    return Consumer(
      builder: (context, watch, err) {
        watch(reqServiceProv);
        return Scaffold(
            backgroundColor: Colors.black,
            body: //getBody(watcher),
                SafeArea(
              child: Column(
                children: [
                  header,
                  GlobalTheme.globalDivider,
                  ElevatedButton(
                      onPressed: () async {
                        AppSongModel sampleSong = AppSongModel(
                            uid: '1110605242',
                            album: 'testAlbum',
                            title: 'testTigle',
                            artistName: 'testArtist');
                        Request sampleRequest = Request(
                            fromUid: '456',
                            toUid: _authService.getCurrentUser().uid,
                            song: sampleSong,
                            requestTimeMs: Timestamp.fromDate(DateTime.now()),
                            paymentAmount: 5);
                        await _userRequestService.makeRequest(sampleRequest);
                      },
                      child: Text('createRequest')),
                  ElevatedButton(
                    style: globalTheme.signUpButton,
                    onPressed: () {},
                    child: Text(
                      'Go Offline',
                    ),
                  ),
                  RequestListWidget()
                ],
              ),
            ));
      },
    );
  }
}
