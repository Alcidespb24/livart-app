import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
          Container(
            height: double.infinity,
            child: Scrollbar(
              isAlwaysShown: true,
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
                      style: TextStyle(color: Colors.white),
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
