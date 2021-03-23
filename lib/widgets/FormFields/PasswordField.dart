import 'package:flutter/material.dart';
import 'package:flutter_app/services/InputValidator.dart';

typedef void onChangedCallback(String pwd);

class PasswordField extends StatelessWidget {
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
        onChangedPassword(value);
      },
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Color(0xFFADADAD),
          size: 13,
        ),
        contentPadding: EdgeInsets.all(5),
        filled: true,
        fillColor: Color(0xFFC4C4C4).withOpacity(0.1),
        labelText: '*********',
        labelStyle: TextStyle(
          color: Color(0xFFADADAD),
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
          borderSide: BorderSide(
            color: Color(0x3CADADAD),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
