import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:geolocator/geolocator.dart';

class DjDashboard extends StatefulWidget {
  static const String id = 'djDashboard_screen';

  @override
  _DjDashboardState createState() => _DjDashboardState();
}

class _DjDashboardState extends State<DjDashboard> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List songsRequested;
    var header = Text(
      'Requests',
      style: TextStyle(color: Colors.white, fontSize: 35),
    );
    return SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 150),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    header,
                    GlobalTheme.globalDivider,
                    Column(
                      children: List.generate(
                        5,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 40, left: 45, bottom: 10),
                            child: GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: (size.width - 80) * 0.23,
                                      height: 50,
                                      decoration:
                                          BoxDecoration(color: Colors.green), //Amount paid for the song
                                    ),
                                    Container(
                                      width: (size.width - 80) * 0.40,
                                      height: 50,
                                      // child: Text(
                                      //   'Song',
                                      //   style: GlobalTheme.requestsStyle,
                                      // ),
                                      decoration:
                                          BoxDecoration(color: Colors.white), //Title of the song
                                    ),
                                    Container(
                                      width: (size.width - 80) * 0.23,
                                      height: 50,
                                      decoration:
                                          BoxDecoration(color: Colors.blue), //Time left for the request to be filled
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      style: globalTheme.signUpButton,
                      onPressed: () {},
                      child: Text(
                        'Go Offline',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
