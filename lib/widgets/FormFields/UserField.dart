import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';

typedef void onChangedCallback(String uName);

class UserField extends StatelessWidget {
  final onChangedCallback onChangedUname;

  UserField({required this.onChangedUname});

  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        ;
      },
      onChanged: (value) {
        onChangedUname(value);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.face_retouching_natural,
          color: GlobalTheme.iconsColor,
          size: 13,
        ),
        contentPadding: EdgeInsets.all(5),
        filled: true,
        fillColor: Color(0xFFC4C4C4).withOpacity(0.1),
        labelText: 'username',
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
