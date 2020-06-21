import 'package:flutter/material.dart';

import './screens/student_registration_screen.dart';
import './screens/login_screen.dart';
import './screens/course_job_screen.dart';
import './screens/course_student_screen.dart';
import './screens/favourited_students_screen.dart';
import './screens/favourites_companies_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.white,
        fontFamily: 'Pacifico',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginScreen.routeName,
      home: HomeScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        StudentRegistrationPage.routeName: (ctx) => StudentRegistrationPage(),
        CourseJobScreen.routeName: (ctx) => CourseJobScreen(),
        CourseStudentScreen.routeName: (ctx) => CourseStudentScreen(),
        FavouritedStudentsScreen.routeName: (ctx) => FavouritedStudentsScreen(),
        FavouritesCompaniesScreen.routeName: (ctx) => FavouritesCompaniesScreen(),
      },
    );
  }
}
