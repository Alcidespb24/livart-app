import 'package:flutter/material.dart';
import 'package:flutter_app/screens/places_api/location_search.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/reusable_card.dart';
import 'package:flutter_app/widgets/search_bar.dart';

class DjHome extends StatefulWidget {
  @override
  _DjHomeState createState() => _DjHomeState();
}

class _DjHomeState extends State<DjHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalTheme().globalAppBar,
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ReusableCard(
                Column(
                  children: [
                    SearchBar(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
