import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  MyButton(this.onPressed,this.title);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: onPressed(),
//                  color: Colors.black,
            child: Text(title,
                style: TextStyle(
//                        color: Colors.white,
                )),
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(Colors.black),
              enableFeedback: true,
            ),
          ),
        ));
  }
}
