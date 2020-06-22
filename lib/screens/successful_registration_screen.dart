import 'package:flutter/material.dart';

class SuccessfulRegistration extends StatelessWidget {
  static const routeName = '/successfulRegistration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          'PerFit',
          style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 20,
                color: Theme.of(context).accentColor,
              ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Successfully registered'),
      ),
    );
  }
}
