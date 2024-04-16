import 'package:flutter/material.dart';
import '../res/my_colors.dart';

class MyEmptyView extends StatelessWidget {
  final String title;
  final IconData icon;

  MyEmptyView(this.title,{ this.icon = Icons.info_outline});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 120,
          color: MyColors.grey,
        ),
        Center(
            child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: MyColors.grey),
        )),
      ],
    );
  }
}
