import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/data_models/songDataModel.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/UserRequestService.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/RequestList/RequestListWidget.dart';
import 'package:geolocator/geolocator.dart';

class DjDashboard extends StatefulWidget {
  static const String id = 'djDashboard_screen';

  @override
  _DjDashboardState createState() => _DjDashboardState();
}

class _DjDashboardState extends State<DjDashboard> {
  AuthService _authService = AuthService();
  UserRequestService _userRequestService = UserRequestService();

  @override
  void initState() {
    super.initState();
    getLocation();
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
                    SongModel sampleSong = SongModel(
                        uid: 78945,
                        album: 'testAlbum',
                        title: 'testTigle',
                        artistName: 'testArtist');
                    Request sampleRequest = Request(
                        fromUid: '456',
                        toUid: _authService.getCurrentUser().uid,
                        song: sampleSong,
                        requestTimeMs: DateTime.now().millisecondsSinceEpoch,
                        triesLeft: 5,
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
              RequestListWidget(),
            ],
          ),
        ));
  }
}
