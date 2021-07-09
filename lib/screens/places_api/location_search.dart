import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/SearchListWidget.dart';
import 'package:flutter_app/widgets/minimum_money.dart';
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
      appBar: GlobalTheme().globalAppBar,
      body: Stack(
        children: <Widget>[
          Center(
            heightFactor: 4,
            child: Text(
              'Session Setup',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff181717)),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 70, left: 60, right: 60),
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
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
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
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
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
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        Flexible(
                          child: MinimumAmount(),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
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
            ],
          ),
          Column(),
        ],
      ),
    );
  }
}
