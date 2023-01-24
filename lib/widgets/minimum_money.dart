import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MinimumAmount extends StatefulWidget {
  @override
  _MinimumAmountState createState() => _MinimumAmountState();
}

class _MinimumAmountState extends State<MinimumAmount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 41,
      child: TextField(
        textAlign: TextAlign.center,
        controller: TextEditingController()..text = '\$',
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        style: TextStyle(
          fontSize: 13,
          color: Colors.white,
          decorationColor: Colors.white.withOpacity(0),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(5),
          filled: true,
          fillColor: Color(0xff242423),
          hintText: '\$',
          hintStyle: TextStyle(
              wordSpacing: 1,
              color: Colors.white.withOpacity(0.5),
              fontSize: 12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }
}
