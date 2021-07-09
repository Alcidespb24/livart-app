import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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

  var offlineButton = Container(
    margin: EdgeInsets.all(20.0),
    height: 30,
    width: 180,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff00F0FF).withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      onPressed: () {},
      child: Text(
        'Go Offline',
        style: TextStyle(color: Colors.black),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, err) {
        watch(reqServiceProv);
        return Scaffold(
          appBar: GlobalTheme().globalAppBar,
          backgroundColor: Colors.black,
          body: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    Text(
                      'Requests',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        decorationColor: Colors.grey,
                      ),
                    ),
                    Divider(
                      indent: 130,
                      endIndent: 130,
                      color: Colors.white,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          AppSongModel sampleSong = AppSongModel(
                              uid: 78945.toString(),
                              album: 'testAlbum',
                              title: 'testTigle',
                              // artworkRawUrl: ,
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
                    RequestListWidget(),
                    offlineButton,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
