import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';
typedef void onPressedCallback();
class MenuItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final onPressedCallback onPressedItem;

  MenuItems({this.icon, this.title, @required this.onPressedItem});
  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [TextButton.icon(
          label: Text(
            title,
            style: globalTheme.menuText,
          ),
          icon: Icon(
            icon,
            color: globalTheme.iconsColor,
            size: 25,
          ),
          onPressed: (){
            onPressedItem();
          },
        )],
      ),
    );
  }
}