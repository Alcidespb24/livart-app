import 'package:flutter/material.dart';
import 'package:flutter_app/services/InputValidator.dart';

typedef void onChangedCallback(String email);

class EmailField extends StatelessWidget{
  final onChangedCallback onChangedEmail;

  EmailField({@required this.onChangedEmail});
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (!EmailValidator.validEmail(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onChanged: (value) {
        onChangedEmail('value');
      },
      decoration: InputDecoration(
        labelText: 'Email',
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
