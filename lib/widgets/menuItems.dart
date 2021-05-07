import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';
// ignore: camel_case_types
typedef void onPressedCallback();
class MenuItems extends StatefulWidget {
  final String title;
  final IconData icon;
  final onPressedCallback onPressedItem;

  MenuItems({this.icon, this.title, @required this.onPressedItem});

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        margin: EdgeInsets.only(left: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [TextButton.icon(
            label: Text(
              widget.title,
              style: TextStyle(color: GlobalTheme.miscellaneous),
            ),
            icon: Icon(
              widget.icon,
              color: GlobalTheme.iconsColor,
              size: 25,
            ),
            onPressed: (){
              widget.onPressedItem();
            },
          )],
        ),
      ),
    );
  }
}