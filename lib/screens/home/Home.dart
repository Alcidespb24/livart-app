import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/data_models/SongStruct.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/FirestoreRequestService.dart';
import 'package:flutter_app/services/firestore/FirestoreUserService.dart';

String creatorUserName = '';
AppUser currentUser;
final AuthService _authService = AuthService();
final FirestoreRequestService _requestService = FirestoreRequestService();
final FirestoreUserService _userService = FirestoreUserService();

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  Home() {
    _authService.user.first.then((value) {
    //  currentUser = value;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        elevation: 60,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text("Sign Out"),
            onPressed: () async {
              await _authService.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Creator\'s User Name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "invalid username";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty)
                    _userService.searchUsernameLive(value).then((value) {
                      if (value != null) {
                        print(value);
                        creatorUserName = value;
                      } else {
                        creatorUserName = '';
                      }
                    });
                });
              },
            ),
            SizedBox(
              height: 60,
              width: 500,
              child: Text(creatorUserName),
            ),
            ElevatedButton(
                onPressed: () async {
                  _requestService.makeRequest(
                      await createRequest("lla", "mahartist", "djUname"));
                },
                child: Text('create request'))
          ],
        ),
      ),
    );
  }

  Future<Request> createRequest(
      String songName, String artist, String dj) async {
    SongStruct song = new SongStruct(songName: songName, artist: artist);

    if (_userService.userExists(creatorUserName)) {
      AppUser creator =
          await _userService.getUserFromUserName(creatorUserName).then((value) {
        return value;
      });

      Request req = new Request(
          fromUid: _authService.getCurrentUser().uid,
          toUid: creator.uid,
          song: song,
          requestTimeMs: DateTime.now().millisecondsSinceEpoch,
          triesLeft: 0,
          timeRemainingMs: 0);
      print("reached here");
      return req;
    }
  }
}
