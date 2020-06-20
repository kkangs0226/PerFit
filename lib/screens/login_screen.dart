import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  Widget _buildLoginField(String hintText, bool obscure, BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 70.0),
      child: TextFormField(
        obscureText: obscure,
        autocorrect: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationHomepageButton(
      BuildContext context, String text, Function function) {
    return SizedBox(
      width: 110,
      height: 40,
      child: FlatButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textColor: Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _buildNavigateRegistrationButton(
      BuildContext context, String accountType, Function function) {
    return FlatButton(
      child: Text(
        accountType,
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      textColor: Theme.of(context).accentColor,
      onPressed: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                'PerFit!',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 45,
                      color: Theme.of(context).accentColor,
                    ),
              ),
            ),
            SizedBox(height: 25),
            _buildLoginField('email', false, context),
            SizedBox(height: 15),
            _buildLoginField('password', true, context),
            SizedBox(height: 50),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Not a member yet?',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Let\'s explore',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  SizedBox(height: 15),
                  _buildNavigationHomepageButton(context, 'Student', () {}),
                  SizedBox(height: 15),
                  _buildNavigationHomepageButton(context, 'Employer', () {}),
                  SizedBox(height: 25),
                  Text(
                    'or',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildNavigateRegistrationButton(
                      context, 'create student account', () {}),
                  _buildNavigateRegistrationButton(
                      context, 'create employer account', () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}