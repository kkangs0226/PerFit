import 'package:flutter/material.dart';

import './screens/forgot_password_screen.dart';
import './screens/registration/student_registration_screen.dart';
import './screens/login_screen.dart';
import 'screens/home/home_bar/course_job_screen.dart';
import 'screens/home/home_bar/course_student_screen.dart';
import 'screens/home/favourites_bar/favourited_students_screen.dart';
import 'screens/home/favourites_bar/favourites_companies_screen.dart';
import 'screens/home/tabs_screen.dart';
import './screens/registration/successful_registration_screen.dart';
import './screens/registration/employer_registration_screen.dart';
import './screens/registration/add_job_screen.dart';
import './screens/company_student_screens/company_details_screen.dart';
import './screens/home/home_bar/new_companies_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        StudentRegistrationPage.routeName: (ctx) => StudentRegistrationPage(),
        CourseJobScreen.routeName: (ctx) => CourseJobScreen(),
        CourseStudentScreen.routeName: (ctx) => CourseStudentScreen(),
        FavouritedStudentsScreen.routeName: (ctx) => FavouritedStudentsScreen(),
        FavouritesCompaniesScreen.routeName: (ctx) =>
            FavouritesCompaniesScreen(),
        EmployerRegistrationPage.routeName: (ctx) => EmployerRegistrationPage(),
        SuccessfulRegistration.routeName: (ctx) => SuccessfulRegistration(),
        ForgotPasswordPage.routeName: (ctx) => ForgotPasswordPage(),
        AddJobPage.routeName: (ctx) => AddJobPage(),
        NewCompaniesScreen.routeName: (ctx) => NewCompaniesScreen(),
        CompanyDetailsScreen.routeName: (ctx) => CompanyDetailsScreen(),
      },
    );
  }
}
