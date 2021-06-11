import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/data_models/SongStruct.dart';
import 'package:flutter_app/data_models/songDataModel.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/FirestoreUserService.dart';
import 'package:flutter_app/services/firestore/UserRequestService.dart';

String creatorUserName = '';
final AuthService _authService = AuthService();
final UserRequestService _requestService = UserRequestService();
final FirestoreUserService _userService = FirestoreUserService();

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  Home() {}

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
    SongModel song = new SongModel(title: songName, artistName: artist);

    if (_userService.userExists(creatorUserName)) {
      AppUser creator =
          await _userService.getUserFromUserName(creatorUserName).then((value) {
        return value;
      });

      Request req = new Request(
          fromUid: _authService.getCurrentUser().uid,
          toUid: creator.uid,
          song: song,
          requestTimeMs: Timestamp.fromDate(DateTime.now()));
      return req;
    }
  }
}
