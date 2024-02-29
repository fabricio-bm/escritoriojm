import 'package:flutter/material.dart';

import '../res/my_colors.dart';

class MyCardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  final Color cardColor;
  final Color iconColor;
  final Color textColor;
  final double horizontalPadding;
  final bool isLoading;

  const MyCardButton(
      this.title,
      this.icon,
      this.onTap,
      {
    this.cardColor = MyColors.accent,
    this.iconColor = MyColors.white,
    this.textColor = MyColors.textWhite,
    this.horizontalPadding = 8,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      ),
      child: Card(
          color: cardColor,
          child: InkWell(
            onTap: isLoading ? null : onTap(),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getIconeETextoBotao()),
              ),
            ),
          )),
    );
  }

  List<Widget> _getIconeETextoBotao() {
    if (isLoading) {
      return <Widget>[
        Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(textColor),
            )),
      ];
    }
    return <Widget>[
      Icon(
        icon,
        color: iconColor,
      ),
      Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
    ];
  }
}
