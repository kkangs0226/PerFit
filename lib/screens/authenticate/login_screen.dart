import 'package:flutter/material.dart';

import './registration/employer_registration/employer_registration_screen.dart';
import './registration/student_registration/student_registration_screen.dart';
import './forgot_password_screen.dart';
import '../../services/auth.dart';
import '../home/tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  Widget _buildLoginField(
      {String hintText,
      bool obscure,
      BuildContext context,
      Function validator,
      Function function}) {
    return Container(
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
        validator: validator,
        onChanged: function,
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
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
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
              height: 60,
            ),
            Center(
              child: Text(
                'PerFit!',
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 45,
                      color: Theme.of(context).accentColor,
                    ),
              ),
            ),
            SizedBox(height: 25),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildLoginField(
                    hintText: 'email',
                    context: context,
                    obscure: false,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid email';
                      } else {
                        return null;
                      }
                    },
                    function: (val) {
                      setState(() {
                        _email = val;
                        print(_email);
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  Stack(
                    children: [
                      _buildLoginField(
                        hintText: 'password',
                        context: context,
                        obscure: true,
                        validator: (val) {
                          if (val.length < 6) {
                            return 'Please enter a valid password';
                          } else {
                            return null;
                          }
                        },
                        function: (val) {
                          setState(() {
                            _password = val;
                            print(_password);
                          });
                        },
                      ),
                      Positioned(
                        right: 70,
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          color: Theme.of(context).primaryColor,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              print('success');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
              child: FlatButton(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(ForgotPasswordPage.routeName);
                },
              ),
            ),
            SizedBox(height: 30),
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
                  _buildNavigationHomepageButton(
                    context,
                    'Student',
                    () {
                      Navigator.of(context).pushNamed(TabsScreen.routeName);
                    },
                  ),
                  SizedBox(height: 15),
                  _buildNavigationHomepageButton(context, 'Employer', () {
                    Navigator.of(context).pushNamed(TabsScreen.routeName);
                  }),
                  SizedBox(height: 25),
                  Text(
                    'or',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildNavigateRegistrationButton(
                      context, 'create student account', () {
                    Navigator.of(context)
                        .pushNamed(StudentRegistrationPage.routeName);
                  }),
                  _buildNavigateRegistrationButton(
                      context, 'create employer account', () {
                    Navigator.of(context)
                        .pushNamed(EmployerRegistrationPage.routeName);
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
