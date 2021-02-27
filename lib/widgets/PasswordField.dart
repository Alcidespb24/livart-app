import 'package:flutter/material.dart';
import 'package:flutter_app/services/InputValidator.dart';

typedef void onChangedCallback(String pwd);

class PasswordField extends StatelessWidget{
  final onChangedCallback onChangedPassword;

  PasswordField({@required this.onChangedPassword});
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (!PasswordValidator.validPassword(value)) {
          return 'Please enter a valid password';
        }
        return null;
      },
      onChanged: (value) {
        onChangedPassword('value');
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Color(0xFFADADAD),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Color(0xFFADADAD)),
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }
}
