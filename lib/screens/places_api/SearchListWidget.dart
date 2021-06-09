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
            height: 200,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    list[index].name,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
