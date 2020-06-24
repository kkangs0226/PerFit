import 'package:flutter/material.dart';

class DropdownBorder extends StatelessWidget {
  const DropdownBorder({
    Key key,
    @required this.context,
    @required this.child,
  }) : super(key: key);

  final BuildContext context;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      margin: EdgeInsets.only(left: 30, right: 180),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: child,
    );
  }
}
