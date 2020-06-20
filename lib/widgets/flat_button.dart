import 'package:flutter/material.dart';

class CustomFlatButtonIcon extends StatelessWidget {
  final String text;
  final Function handler;
  final Icon icon;

  CustomFlatButtonIcon(this.text, this.handler, this.icon);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: handler,
      icon: icon,
      label: Text(text),
    );
  }
}
