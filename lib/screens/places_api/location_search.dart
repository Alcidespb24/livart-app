import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/places_api/SearchListWidget.dart';
import 'package:flutter_app/services/ProvidersService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Consumer(
                    builder: (context, watch, child) {
                      return Container(
                        margin: EdgeInsets.only(right: 25, left: 25),
                        height: 32,
                        width: double.infinity,
                        child: TextField(
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            decorationColor: Colors.white.withOpacity(0),
                          ),
                          onChanged: (value) => context
                              .read(placeListServiceProvider.notifier)
                              .searchPlace(value),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              EvaIcons.search,
                              size: 13,
                              color: Colors.white.withOpacity(0.9),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.4),
                            hintText: 'Search Places',
                            hintStyle: TextStyle(
                                wordSpacing: 1,
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: SearchListWidget(),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 32,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF7014E4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
