import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.context,
    @required this.labelText,
    @required this.paddingRight,
    @required this.obscure,
    @required this.enableText,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
  }) : super(key: key);

  final BuildContext context;
  final String labelText;
  final double paddingRight;
  final bool obscure;
  final bool enableText;
  final TextInputType textInputType;
  final maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: paddingRight),
      child: TextFormField(
        readOnly: !enableText,
        obscureText: obscure,
        maxLines: maxLines,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
