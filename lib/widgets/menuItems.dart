import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';
typedef void onPressedCallback();
class MenuItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final onPressedCallback onPressedItem;

  MenuItems({this.icon, this.title, @required this.onPressedItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        margin: EdgeInsets.only(left: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [TextButton.icon(
            label: Text(
              title,
              style: TextStyle(color: GlobalTheme.miscellaneous),
            ),
            icon: Icon(
              icon,
              color: GlobalTheme.iconsColor,
              size: 25,
            ),
            onPressed: (){
              onPressedItem();
            },
          )],
        ),
      ),
    );
  }
}