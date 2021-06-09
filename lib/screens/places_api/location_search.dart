import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/places_api/SearchListWidget.dart';
import 'package:flutter_app/services/ProvidersService.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:flutter_app/screens/places_api/place_search.dart';


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
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Text(
                  'Where are you playing ?',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer(

                    builder: (context,watch,child) {


                    return TextField(
                      onChanged: (value) => context.read(placeListServiceProvider.notifier).searchPlace(value),
                      decoration: InputDecoration(
                        suffixIcon: Icon(EvaIcons.search, color: Colors.white,),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.4),
                        hintText: 'Search Places ...',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );},
                  ),
                ),
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
