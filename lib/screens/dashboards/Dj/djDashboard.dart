import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/themes/theme.dart';

class DjDashboard extends StatefulWidget {
  static const String id = 'djDashboard_screen';

  @override
  _DjDashboardState createState() => _DjDashboardState();
}

class _DjDashboardState extends State<DjDashboard> {

  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List songsRequested;
    var header = Text(
      'REQUESTS',
      style: TextStyle(color: Colors.white, fontSize: 25),
    );
    int amount = 15;
    String money = '\$$amount';
    String timer = 30.toString();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: GlobalTheme.backgroundGradient,
          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    width: (size.width - 80) * 0.23,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.lightGreenAccent),
                                    child: Text(
                                      money,
                                      style: TextStyle(color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ), //Time left for the request to be filled
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    width: (size.width - 80) * 0.40,
                                    height: 50,
                                    child: Text(
                                      'Song',
                                      style: GlobalTheme.requestsStyle,
                                      textAlign: TextAlign.center,
                                    ), //Title of the song
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    width: (size.width - 80) * 0.23,
                                    height: 50,
                                    child: Text(
                                      timer,
                                      style: GlobalTheme.requestsStyle,
                                      textAlign: TextAlign.center,
                                    ), //Time left for the request to be filled
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  GlobalTheme.globalDivider,
                  ElevatedButton(
                    style: globalTheme.offlineButton,
                    onPressed: () {},
                    child: Text(
                      'Go Offline',
                      style: TextStyle(color: GlobalTheme.miscellaneous1),
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
