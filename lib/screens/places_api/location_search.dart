import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';


class LocationSearch extends StatefulWidget {
  const LocationSearch({Key key}) : super(key: key);

  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final bloc = Bloc();

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
                  child: TextField(
                    onChanged: (value) => bloc.searchPlace(value),
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
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      if (bloc.searchResults != null &&
                          bloc.searchResults.length != 0)
                        Container(
                          color: Colors.red,
                          height: 200,
                          child: ListView.builder(
                            itemCount: bloc.searchResults.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  bloc.searchResults[index].name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
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
