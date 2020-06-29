import 'package:flutter/material.dart';

class TextFieldHeader extends StatelessWidget {
  const TextFieldHeader({
    Key key,
    @required this.error,
    @required this.context,
    @required this.header,
  }) : super(key: key);

  final BuildContext context;
  final String header;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 40),
      child: Text(
        header,
        style: error
            ? TextStyle(color: Colors.red)
            : TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
      ),
    );
  }
}
