import 'package:flutter/material.dart';
import 'package:flutter_app/services/place_service.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/SearchListWidget.dart';
import 'package:flutter_app/widgets/minimum_money.dart';
import 'package:flutter_app/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: GlobalTheme().globalAppBar,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 70, left: 125),
            child: Text(
              'Session Setup',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[900]!,
                          offset: Offset(
                            1.0,
                            1.0,
                          ),
                          blurRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.grey[900]!,
                          offset: Offset(
                            -1.0,
                            -1.0,
                          ),
                          blurRadius: 1.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff181717)),
                  padding: EdgeInsets.only(top: 8, bottom: 5),
                  margin: EdgeInsets.only(
                      top: 100, left: 60, right: 60, bottom: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Location: ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(child: SearchBar()),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Expanded(
                      //   child: SearchListWidget(),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Minimum Amount Per Song: ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: MinimumAmount(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Maximum Amount of Request: ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: MinimumAmount(),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        height: 25,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Start Session',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: GlobalTheme().signUpButton,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: Text(
                              'Earnings',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 25),
                            child: Text(
                              'Hottest Tracks',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[900]!,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 1.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.grey[900]!,
                                      offset: Offset(
                                        -1.0,
                                        -1.0,
                                      ),
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color(0xff181717)),
                              padding: EdgeInsets.all(10),
                              margin:
                                  EdgeInsets.only(top: 0, left: 0, right: 5),
                              width: 140,
                              height: 140,
                              child: Center(
                                child: Text(
                                  '\$500',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.green[800],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[900]!,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 1.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.grey[900]!,
                                      offset: Offset(
                                        -1.0,
                                        -1.0,
                                      ),
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color(0xff181717)),
                              padding: EdgeInsets.all(8),
                              margin:
                                  EdgeInsets.only(top: 0, left: 5, right: 0),
                              width: 140,
                              height: 140,
                              child: Card(
                                color: Colors.transparent,
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: false,
                                  children: <Widget>[
                                    ListTile(
                                      minLeadingWidth: 0,
                                      leading: Icon(
                                        Icons.plus_one,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      title: Text(
                                        'Name of Song',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    ListTile(
                                      minLeadingWidth: 0,
                                      leading: Icon(
                                        Icons.plus_one,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      title: Text(
                                        'Name of Song',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    ListTile(
                                      minLeadingWidth: 0,
                                      leading: Icon(
                                        Icons.plus_one,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      title: Text(
                                        'Name of Song',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
