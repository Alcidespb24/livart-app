import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/menuItems.dart';
import 'package:flutter_app/services/ACRCloudService.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DjRequests extends HookWidget {
  static const String id = 'djRequests_screen';
  @override
  Widget build(BuildContext context) {

    final vm = useProvider(homeViewModel);
    String songName = 'Name of the song';
    String artistName = 'Name of the artist';
    int tries = 3;

    return ProviderListener<HomeViewModel>(
      provider: homeViewModel,
      onChange: (context, vm) {
        if (vm.success) {}
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: GlobalTheme.backgroundGradient,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    vm.startRecognizing();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Time'),
                        Column(
                          children: <Widget>[
                            Text(songName),
                            Text(artistName),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              tries.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
