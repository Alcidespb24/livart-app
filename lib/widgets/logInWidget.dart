import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/dashboards/djDashboard.dart';
import 'package:flutter_app/screens/dashboards/sideBarLayout.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/FirestoreRequestService.dart';
import 'package:flutter_app/services/firestore/FirestoreUserService.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/FormFields/EmailField.dart';
import 'package:flutter_app/widgets/FormFields/PasswordField.dart';

class LogInWidget extends StatefulWidget {
  LogInWidget({this.userRole});

  final Role userRole;

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  final FirestoreUserService _userService = FirestoreUserService();
  final FirestoreRequestService _requestService = FirestoreRequestService();
  final AuthService _authService = AuthService();
  String emailField = '';
  String passwordField = '';
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(right: 50, left: 50),
        child: Column(
          children: <Widget>[
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24, height: 3, color: Colors.white),
            ),
            SizedBox(height: 15),
            EmailField(onChangedEmail: (String email) {
              setState(() {
                emailField = email;
              });
            }),
            SizedBox(height: 15),
            PasswordField(onChangedPassword: (String pwd) {
              setState(() {
                passwordField = pwd;
              });
            }),
            Container(
              margin: EdgeInsets.only(left: 120),
              child: TextButton(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 9,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                //TODO: This needs to take the user to another Screen where he/she is asked to enter his email address
                onPressed: () async {
                  //TODO: This should remain commented until the "Forgot Password" screen is created
                  //_authService.resetPwd(emailField);
                },
              ),
            ),
            Container(
              height: 38,
              width: 150,
              margin: EdgeInsets.only(left: 35, right: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: GlobalTheme.buttonColor4,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: GlobalTheme.buttonColor4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  elevation: 1,
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: GlobalTheme.miscellaneous,
                  ),
                ),
                onPressed: () async {
                  await _authService.signInEmailPwd(emailField, passwordField);
                  if (_authService.hasError()) {
                    //TODO: Handle Error and send information about what went wrong to the user
                    print(_authService.failure.toString());
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DjDashboard()));
                },
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    height: 35,
                    thickness: 0.5,
                    indent: 0,
                    endIndent: 10,
                    color: GlobalTheme.miscellaneous,
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 35,
                    thickness: 0.5,
                    indent: 10,
                    endIndent: 0,
                    color: GlobalTheme.miscellaneous,
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: GlobalTheme.buttonColor3,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: GlobalTheme.buttonColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  elevation: 1,
                ),
                label: Text(
                  'Sign in with Google',
                  style: TextStyle(color: GlobalTheme.miscellaneous1),
                ),
                icon: Icon(
                  CommunityMaterialIcons.google,
                  size: 20,
                  color: Color(0xFFDC1919),
                ),
                onPressed: () async {
                  await _authService.signInWithGoogle(widget.userRole);

                  await _userService
                      .createUserData(_authService.getCurrentUser());

                  // if the user is a creator create a document to handle requests
                  if (_authService.getCurrentUser().userRole == Role.CREATOR) {
                    await _requestService.createCreatorRequestDoc(
                        _authService.getCurrentUser().uid);
                  }

                  Navigator.pop(context, SideBarLayout());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
