import 'package:flutter/material.dart';

import '../res/my_colors.dart';

class MyLoadingView extends StatelessWidget {
  final String title;
  final IconData icon;

  MyLoadingView(this.title,{ this.icon = Icons.access_time});
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
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(MyColors.grey),
        )
      ],
    );
  }
}
