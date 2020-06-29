import 'package:flutter/material.dart';
import 'package:perfit_app/dummy_data.dart';
import 'package:perfit_app/screens/company_student_screens/student_details_screen.dart';
import 'package:perfit_app/screens/home/home_bar/offer_status_employer_screen.dart';
import 'package:perfit_app/screens/home/home_bar/offer_status_student_screen.dart';
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
import 'screens/home/home_bar/course_job_screen.dart';
import 'screens/home/home_bar/course_student_screen.dart';
import 'screens/home/favourites_bar/favourited_students_screen.dart';
import 'screens/home/favourites_bar/favourites_companies_screen.dart';
import 'screens/home/tabs_screen.dart';
import './screens/company_student_screens/company_details_screen.dart';
import './screens/home/home_bar/new_companies_screen.dart';
import './screens/home/tabs_screen.dart';
import './models/student.dart';
import './models/company.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Student> _offerListOfStudents = [];
  List<Company> _favouritedCompanies = [];

  bool _gaveOffer(String studentName) {
    return _offerListOfStudents.any((student) => student.name == studentName);
  }

  void _toggleOffer(String studentName) {
    final existingIndex = _offerListOfStudents
        .indexWhere((student) => student.name == studentName);
    if (existingIndex < 0) {
      setState(() {
        _offerListOfStudents.add(DummyData.DUMMY_STUDENTS
            .firstWhere((student) => student.name == studentName));
      });
    } else {
      setState(() {
        _offerListOfStudents.removeAt(existingIndex);
      });
    }
  }

  bool _isFavourite(String companyId) {
    return _favouritedCompanies.any((company) => company.id == companyId);
  }

  void _toggleFavourites(String companyId) {
    final existingIndex =
        _favouritedCompanies.indexWhere((company) => company.id == companyId);
    if (existingIndex < 0) {
      setState(() {
        _favouritedCompanies.add(DummyData.DUMMY_COMPANIES
            .firstWhere((company) => company.id == companyId));
      });
    } else {
      setState(() {
        _favouritedCompanies.removeAt(existingIndex);
      });
    }
  }

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
                headline6: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                headline1: TextStyle(
                  fontSize: 20,
                ),
                headline2: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                bodyText1: TextStyle(
                  fontFamily: 'Monserrat',
                ),
                bodyText2: TextStyle(fontFamily: 'Monserrat'),
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Wrapper.routeName,
        routes: {
          TabsScreen.routeName: (ctx) => TabsScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          StudentRegistrationPage.routeName: (ctx) => StudentRegistrationPage(),
          EmployerRegistrationPage.routeName: (ctx) =>
              EmployerRegistrationPage(),
          SuccessfulRegistration.routeName: (ctx) => SuccessfulRegistration(),
          ForgotPasswordPage.routeName: (ctx) => ForgotPasswordPage(),
          AddJobPage.routeName: (ctx) => AddJobPage(),
          Wrapper.routeName: (ctx) => Wrapper(),
          CourseJobScreen.routeName: (ctx) => CourseJobScreen(),
          CourseStudentScreen.routeName: (ctx) => CourseStudentScreen(),
          FavouritedStudentsScreen.routeName: (ctx) =>
              FavouritedStudentsScreen(),
          FavouritesCompaniesScreen.routeName: (ctx) =>
              FavouritesCompaniesScreen(),
          NewCompaniesScreen.routeName: (ctx) => NewCompaniesScreen(),
          CompanyDetailsScreen.routeName: (ctx) =>
              CompanyDetailsScreen(_toggleFavourites, _isFavourite),
          OfferStatusEmployerScreen.routeName: (ctx) =>
              OfferStatusEmployerScreen(),
          OfferStatusStudentScreen.routeName: (ctx) =>
              OfferStatusEmployerScreen(),
          StudentDetailsScreen.routeName: (ctx) =>
              StudentDetailsScreen(_toggleOffer, _gaveOffer),
        },
      ),
    );
  }
}
