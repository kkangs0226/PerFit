import 'package:flutter/material.dart';

import './screens/forgot_password_screen.dart';
import './screens/student_registration_screen.dart';
import './screens/login_screen.dart';
import './screens/successful_registration_screen.dart';
import './screens/employer_registration_screen.dart';
import './screens/add_job_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        StudentRegistrationPage.routeName: (ctx) => StudentRegistrationPage(),
        EmployerRegistrationPage.routeName: (ctx) => EmployerRegistrationPage(),
        SuccessfulRegistration.routeName: (ctx) => SuccessfulRegistration(),
        ForgotPasswordPage.routeName: (ctx) => ForgotPasswordPage(),
        AddJobPage.routeName: (ctx) => AddJobPage(),
      },
    );
  }
}
