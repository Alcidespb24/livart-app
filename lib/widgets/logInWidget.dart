import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_app/screens/dashboards/sideBarLayout.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/widgets/EmailField.dart';
import 'package:flutter_app/widgets/PasswordField.dart';

class LogInWidget extends StatefulWidget {
  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  final AuthService _authService = AuthService();
  GlobalTheme globalTheme = GlobalTheme();
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
              'Welcome Back',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFFFFFFF),
                height: 3.4,
                fontFamily: 'RobotoCondensed-Bold.ttf',
              ),
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
              margin: EdgeInsets.only(left: 180, top: 5),
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
              margin: EdgeInsets.only(left: 35, right: 35, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Color(0xFFA400C1),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onSurface: Color(0xFF388E3C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  elevation: 1,
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                onPressed: () async {
                  await _authService.signInEmailPwd(emailField, passwordField);
                  if (_authService.hasError()) {
                    //TODO: Handle Error and send information about what went wrong to the user
                    print(_authService.failure.toString());
                  }
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
                    color: Colors.white,
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
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
              margin: EdgeInsets.only(left: 40, right: 47),
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: AlignmentDirectional(0.0, -0.8),
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Color(0xFFDC1919).withOpacity(0.8),
                //     Color(0xFFE3F509).withOpacity(0.8),
                //   ],
                // ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  elevation: 1,
                ),
                label: Text('Sign in with Google'),
                icon: Icon(
                  CommunityMaterialIcons.google,
                  size: 20,
                  color: Color(0xFFDC1919),
                ),
                onPressed: () async {
                  await _authService.signInWithGoogle();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
