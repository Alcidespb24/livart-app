import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';

class MenuItems extends StatelessWidget {
  final String title;
  final IconData icon;

  MenuItems(this.icon, this.title);

  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              color: globalTheme.iconsColor,
              size: 25,
            ),
          ),
          Text(
            title,
            style: globalTheme.menuText,
          ),
        ],
      ),
    );
  }
}
