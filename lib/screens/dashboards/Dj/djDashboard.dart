import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/data_models/songDataModel.dart';
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
          backgroundColor: Colors.black,
          body: Stack(
            children: <Widget>[
              Column(
                children: [
                  Container(margin:EdgeInsets.only(top: 100),child: header),
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
                            requestTimeMs: Timestamp.fromDate(DateTime.now()),
                            paymentAmount: 5);
                        await _userRequestService.makeRequest(sampleRequest);
                      },
                      child: Text('createRequest')),
                  RequestListWidget(),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    height: 30,
                    width: 180,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFe63946).withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Go Offline',
                      ),
                    ),
                  ),
                  Divider(indent: 5, endIndent: 5,color: Colors.white.withOpacity(0.4),height: 5,),
                ],
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            // onTap: (){setState(() {
            //
            // });},
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            backgroundColor: Color(0xff27272a).withOpacity(0.3),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    EvaIcons.homeOutline,
                    color: Colors.white,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(
                  EvaIcons.music,
                  color: Colors.white,
                ),
                label: 'Requests Made',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  EvaIcons.settings,
                  color: Colors.white,
                ),
                label: 'Settings',
              ),
            ],
            // onTap: (){},
          ),
        );
      },
    );
  }
}
