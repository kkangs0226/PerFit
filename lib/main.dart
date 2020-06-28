import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/authenticate/forgot_password_screen.dart';
import './screens/authenticate/registration/student_registration/student_registration_screen.dart';
import './screens/authenticate/login_screen.dart';
import './screens/authenticate/registration/successful_registration_screen.dart';
import './screens/authenticate/registration/employer_registration/employer_registration_screen.dart';
import './screens/authenticate/registration/employer_registration/add_job_screen.dart';
import './services/auth.dart';
import './models/user.dart';
import './screens/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.white,
          fontFamily: 'Pacifico',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  fontSize: 20,
                ),
                headline2: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Wrapper.routeName,
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          StudentRegistrationPage.routeName: (ctx) => StudentRegistrationPage(),
          EmployerRegistrationPage.routeName: (ctx) =>
              EmployerRegistrationPage(),
          SuccessfulRegistration.routeName: (ctx) => SuccessfulRegistration(),
          ForgotPasswordPage.routeName: (ctx) => ForgotPasswordPage(),
          AddJobPage.routeName: (ctx) => AddJobPage(),
          Wrapper.routeName: (ctx) => Wrapper(),
        },
      ),
    );
  }
}
