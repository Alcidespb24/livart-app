import 'package:flutter/material.dart';
import 'package:flutter_app/services/ProvidersService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


class SearchBar extends StatefulWidget {

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
