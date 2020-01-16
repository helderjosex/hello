import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;

  ButtonWidget(this.text, this.onPressed, {this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
