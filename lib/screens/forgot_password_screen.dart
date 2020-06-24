import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const routeName = '/forgotPasswordPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Text('Forgot password page'),
      ),
    );
  }
}
