import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perfit_app/models/company.dart';
import 'package:perfit_app/widgets/home_bar/new_students_joined_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/home_bar/headings_widget.dart';
import '../../../widgets/home_bar/student_widget.dart';
import '../../../widgets/home_bar/companies_widget.dart';
import '../../../widgets/home_bar/course_widget.dart';
import '../../../widgets/home_bar/offer_widget.dart';
import '../../../providers/offers.dart';
import '../../../providers/companies_list.dart';
import '../../../providers/students_list.dart';
import '../../../models/student.dart';
//import '../../../models/';

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
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widgetList,
      ),
    );
  }

  Widget _companyListBuilder(List<Company> widgetList) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widgetList.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: widgetList[i],
          child: CompanyWidget(),
        ),
      ),
    );
  }

  Widget _studentListBuilder(List<Student> widgetList) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widgetList.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: widgetList[i],
          child: StudentWidget(),
        ),
      ),
    );
  }

  Widget _offerListBuilderCompanies(List<OfferItem> widgetList) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widgetList.length,
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider.value(
            value: Provider.of<CompaniesList>(context)
                .LIST_COMPANIES
                .firstWhere((company) => company.id == widgetList[i].companyId),
            child: OfferWidget(false),
          );
        },
      ),
    );
  }

  Widget _offerListBuilderStudents(List<OfferItem> widgetList) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widgetList.length,
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider.value(
            value: Provider.of<StudentsList>(context).LIST_STUDENTS.firstWhere(
                (student) => student.name == widgetList[i].studentId),
            child: OfferWidget(true),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //MediaQueryData mediaQuery = MediaQuery.of(context);

    final companiesList = Provider.of<CompaniesList>(context);
    final studentsList = Provider.of<StudentsList>(context);
    final offers = Provider.of<Offers>(context);
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
            ? _companyListBuilder(companiesList.LIST_COMPANIES)
            : NewStudentsJoined(),
        Heading('OFFER', isStudent),
        isStudent
            ? _offerListBuilderCompanies(offers.offerListCompanies)
            : _offerListBuilderStudents(offers.offerListCompanies),
        SizedBox(height: 50, width: 50),
        Heading('FAVOURITES', isStudent),
        isStudent
            ? _companyListBuilder(companiesList.favouriteCompanies)
            : _studentListBuilder(studentsList.LIST_STUDENTS)

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
