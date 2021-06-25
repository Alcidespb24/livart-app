import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/data_models/songDataModel.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/UserRequestService.dart';
import 'package:flutter_app/services/providers/RequestProvider.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/RequestList/RequestListWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    return Consumer(
      builder: (context, watch, err) {
        watch(reqServiceProv);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'LiveArt',
              style: TextStyle(fontSize: 25),
            ),
          ),
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
                    // ElevatedButton(
                    //     onPressed: () async {
                    //       SongModel sampleSong = SongModel(
                    //           uid: 78945,
                    //           album: 'testAlbum',
                    //           title: 'testTigle',
                    //           artistName: 'testArtist');
                    //       Request sampleRequest = Request(
                    //           fromUid: '456',
                    //           toUid: _authService.getCurrentUser().uid,
                    //           song: sampleSong,
                    //           requestTimeMs: Timestamp.fromDate(DateTime.now()),
                    //           paymentAmount: 5);
                    //       await _userRequestService.makeRequest(sampleRequest);
                    //     },
                    //     child: Text('createRequest')),
                    RequestListWidget(),
                    Container(
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
                          'Go Offline',style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      color: Colors.white.withOpacity(0.4),
                      height: 1.8,
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(0),
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Color(0xff111111)),
              child: BottomNavigationBar(
                // onTap: (){setState(() {
                //
                // });},
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 20,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        EvaIcons.homeOutline,
                        color: Colors.white,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.queue_music,
                        color: Colors.white,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.qr_code_outlined,
                      color: Colors.white,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      EvaIcons.settingsOutline,
                      color: Colors.white,
                    ),
                    label: '',
                  ),
                ],
                // onTap: (){},
              ),
            ),
          ),
        );
      },
    );
  }
}
