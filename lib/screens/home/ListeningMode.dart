import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/notifiers/ACRCloudService.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListeningMode extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final vm = useProvider(acrCloudChangeNotifier);
    return ProviderListener<ACRCloudService>(
      provider: acrCloudChangeNotifier,
      onChange: (context, vm) {
        /*
        if (vm.success) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SongScreen(
                    song: vm.currentSong,
                  )));
        }

         */
      },
      child: Scaffold(
        backgroundColor: Color(0xFF042442),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tap to listen',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 40,
                ),
                AvatarGlow(
                  endRadius: 200.0,
                  animate: vm.isRecognizing,
                  child: GestureDetector(
                    /*onTap: ()=> null;() => vm.isRecognizing
                        ? vm.stopRecognizing()
                        : vm.startRecognizing(),*/
                    child: Material(
                      shape: CircleBorder(),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.all(40),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF089af8)),
                        child: Image.asset(
                          'assets/images/vinyldisc.jpg',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
