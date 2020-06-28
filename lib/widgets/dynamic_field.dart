import 'package:flutter/material.dart';

class DynamicField extends StatefulWidget {
  final String labelText;
  final Function deleteField;
  final List list;
  final String id;
  final dynamic item;
  final Function function;

  const DynamicField({
    @required this.function,
    @required this.item,
    Key key,
    @required this.labelText,
    @required this.id,
    @required this.deleteField,
    @required this.list,
  }) : super(key: key);

  @override
  _DynamicFieldState createState() => _DynamicFieldState();
}

class _DynamicFieldState extends State<DynamicField> {
  Widget _buildTextField({
    @required marginRight,
    @required obscure,
    @required enableText,
    @required function,
    marginLeft = 30.0,
    labelText = '',
    textInputType = TextInputType.text,
    maxLines = 1,
  }) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, right: marginRight),
      child: TextFormField(
        readOnly: !enableText,
        obscureText: obscure,
        maxLines: maxLines,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        onChanged: function,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            _buildTextField(
              labelText: widget.labelText,
              marginRight: 50.0,
              marginLeft: 0.0,
              obscure: false,
              enableText: true,
              function: widget.function,
            ),
            Positioned(
              right: 0,
              top: 10,
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onPressed: () {
                  print(this.widget.id);
                  widget.deleteField(this.widget.list, this.widget.id);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
