import 'package:flutter/material.dart';

class NewStudentsJoined extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Column(children: <Widget>[
      Container(
        height: 200,
        width: double.infinity,
        child: Container(
          /*padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          */
          child: Image.asset(
            'assets/images/new_students.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: 50,
      ),
    ]);
  }
}
