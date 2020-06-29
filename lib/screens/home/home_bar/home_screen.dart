import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perfit_app/widgets/home_bar/new_students_joined_widget.dart';

import '../../../widgets/home_bar/headings_widget.dart';
import '../../../widgets/home_bar/student_widget.dart';
import '../../../widgets/home_bar/companies_widget.dart';
import '../../../widgets/home_bar/course_widget.dart';
import '../../../widgets/home_bar/offer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<Map<String, String>> _courseName = [];

  bool isStudent = true;

  Widget _buildHoriScroll(List<Widget> widgetList) {
    return Container(
      height: 200,
      //color: Theme.of(context).primaryColorLight,
      //width: 100,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widgetList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //MediaQueryData mediaQuery = MediaQuery.of(context);
    return //LayoutBuilder(builder: (ctx, constraints) {
        ListView(
      //padding: const EdgeInsets.all(15),
      children: <Widget>[
        Heading('COURSES', isStudent),
        _buildHoriScroll(
          [
            CourseWidget('COM'),
            CourseWidget('BIZ'),
            CourseWidget('ARTS'),
            CourseWidget('SCI'),
            CourseWidget('ENG'),
          ],
        ),
        Heading('NEW', isStudent),
        isStudent
            ? _buildHoriScroll(
                [
                  CompanyWidget(0),
                  CompanyWidget(1),
                  CompanyWidget(2),
                  CompanyWidget(3),
                  CompanyWidget(4),
                ],
              )
            : NewStudentsJoined(),
        Heading('OFFER', isStudent),
        _buildHoriScroll(
          [
            OfferWidget(0, isStudent),
            OfferWidget(1, isStudent),
            OfferWidget(2, isStudent),
            OfferWidget(3, isStudent),
            OfferWidget(4, isStudent),
          ],
        ),
        SizedBox(height: 50, width: 50),
        Heading('FAVOURITES', isStudent),
        isStudent
            ? _buildHoriScroll(
                [
                  CompanyWidget(0),
                  CompanyWidget(1),
                  CompanyWidget(2),
                ],
              )
            : _buildHoriScroll(
                [
                  StudentWidget(0),
                  StudentWidget(1),
                  StudentWidget(2),
                  StudentWidget(3),
                  StudentWidget(4),
                ],
              )

        /*Container(
          //height: constraints.maxHeight * 0.15,
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildCompanyWidget(context, 'abc'),
              _buildCompanyWidget(context, 'apple'),
              _buildCompanyWidget(context, 'pear'),
              _buildCompanyWidget(context, 'melon'),
            ],
          ),
        ),
        */
      ],
    );
  }
}
