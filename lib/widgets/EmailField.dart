import 'package:flutter/material.dart';
import 'package:flutter_app/services/InputValidator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
typedef void onChangedCallback(String pwd);

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
        prefixIcon: Icon(Icons.email_rounded, color: Color(0xFFADADAD),size: 17,),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Color(0xFFADADAD),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23.0),
          borderSide: BorderSide(color: Color(0x3CADADAD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
