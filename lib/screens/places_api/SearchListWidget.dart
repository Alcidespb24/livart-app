import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_app/services/ProvidersService.dart';

class SearchListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final list = watch(placeListServiceProvider);
    return Stack(
      children: <Widget>[
        if (list.length != 0)
          Divider(
            indent: 25,
            endIndent: 25,
            color: Colors.white.withOpacity(0.5),
            height: 35,
          ),
        Container(
          margin: EdgeInsets.only(top: 25),
          height: double.infinity,
          child: Scrollbar(
            isAlwaysShown: false,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              clipBehavior: Clip.hardEdge,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.location_pin,
                    color: Colors.red,
                  ),
                  title: Text(
                    list[index].name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
