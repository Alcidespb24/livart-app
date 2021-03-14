import 'package:flutter/material.dart';
import 'package:flutter_app/services/InputValidator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef void onChangedCallback(String email);

class EmailField extends StatelessWidget {
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
        prefixIcon: Icon(
          Icons.email_rounded,
          color: Color(0xFFADADAD),
          size: 13,
        ),
        contentPadding: EdgeInsets.all(5),
        filled: true,
        fillColor: Color(0xFFC4C4C4).withOpacity(0.1),
        labelText: 'Email',
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
