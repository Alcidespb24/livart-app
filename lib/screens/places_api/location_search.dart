import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/SearchListWidget.dart';
import 'package:flutter_app/widgets/search_bar.dart';

class HomePlaces extends StatefulWidget {
  @override
  _HomePlacesState createState() => _HomePlacesState();
}

class _HomePlacesState extends State<HomePlaces> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.only(top: 100, bottom: 50),
            child: Column(
              children: [
                Text(
                  'Where are you playing ?',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                SearchBar(),
                Expanded(
                  child: SearchListWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}