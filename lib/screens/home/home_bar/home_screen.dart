import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:perfit_app/screens/company_student_screens/company_details_screen.dart';
import './course_job_screen.dart';
import './new_companies_screen.dart';
import '../favourites_bar/favourites_companies_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<Map<String, String>> _courseName = [];

  Widget _buildCourseWidget(BuildContext cxt, String courseId) {
    Map<String, Map<String, String>> map = {
      'COM': {
        'image': 'assets/images/computing.jpg',
        'name': 'COMPUTING',
        'description': 'IT, Games, AI, etc.'
      },
      'BIZ': {
        'image': 'assets/images/business.jpg',
        'name': 'BUSINESS',
        'description': 'Finance, Banking, etc.'
      },
      'ENG': {
        'image': 'assets/images/engin.jpg',
        'name': 'ENGINEERING',
        'description': 'Electricity, Biomedical, etc.'
      },
      'ARTS': {
        'image': 'assets/images/arts.jpg',
        'name': 'ARTS & SOCIAL SCIENCES',
        'description': 'Sociology, Literature, etc.'
      },
      'SCI': {
        'image': 'assets/images/science.jpg',
        'name': 'SCIENCE',
        'description': 'Chemistry, Biology, etc.'
      },
    };

    return InkWell(
      onTap: () => Navigator.of(cxt).pushNamed(
        CourseJobScreen.routeName,
        //arguments: courseId,
      ),
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Image.asset(map[courseId]['image'],
                      height: 100, width: 160, fit: BoxFit.cover),
                ),
                Container(
                  height: 100,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 150,
                  child: Text(
                    map[courseId]['name'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 10,
            ),
            child: SizedBox(
              height: 20,
              width: 150,
              child: Text(
                map[courseId]['description'],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),

      /*CircleAvatar(
        backgroundColor: Theme.of(context).primaryColorLight,
        radius: 35,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: FittedBox(
            child: Text(courseId),
          ),
        ),
      ),*/
    );
  }

  Widget _buildCompanyWidget(BuildContext cxt, String companyId) {
    return InkWell(
      onTap: () => Navigator.of(cxt).pushNamed(CompanyDetailsScreen.routeName
          //arguments: companyId,
          ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        //elevation: 4,
        margin: EdgeInsets.all(1),
        color: Theme.of(context).primaryColorLight,
        //backgroundColor: Theme.of(context).accentColor,
        child: Container(
          height: 55,
          width: 55,
          padding: EdgeInsets.all(4),
          child: FittedBox(
            child: Text(
              companyId,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadings(String headingName) {
    Map<String, Map<String, Object>> map = {
      'COURSES': {
        //'color': Color.fromRGBO(151, 56, 214, 1.0),
      },
      'FAVOURITES': {
        'route': FavouritesCompaniesScreen.routeName,
        //'color': Color.fromRGBO(250, 5, 103, 1.0)
      },
      'NEW': {
        'route': NewCompaniesScreen.routeName,
        //'color': Color.fromRGBO(119, 196, 18, 1.0)
        //'color': Color.fromRGBO(5, 90, 227, 1.0),
      },
    };

    return Container(
      //height: constraints.maxHeight * 0.1,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20, top: 30, bottom: 15),
      child: headingName == 'COURSES'
          ? Text(
              'COURSES',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(5, 90, 227, 1.0),
              ),
            )
          : GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(map[headingName]['route']),
              child: Text(
                headingName,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(5, 90, 227, 1.0),
                ),
              ),
            ),
    );
  }

  Widget _buildHoriScroll(List<Widget> widgetList) {
    return Container(
      height: 180,
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
    //final mediaQuery = MediaQuery.of(context);
    //final isLandscape = mediaQuery.orientation == Orientation.landscape;
    //final safeArea = mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;

    return //LayoutBuilder(builder: (ctx, constraints) {
        ListView(
      //padding: const EdgeInsets.all(15),
      children: <Widget>[
        _buildHeadings('COURSES'),
        _buildHoriScroll(
          [
            _buildCourseWidget(context, 'COM'),
            _buildCourseWidget(context, 'BIZ'),
            _buildCourseWidget(context, 'ARTS'),
            _buildCourseWidget(context, 'SCI'),
            _buildCourseWidget(context, 'ENG'),
          ],
        ),
        _buildHeadings('NEW'),
        Container(
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
        _buildHeadings('FAVOURITES'),
        Container(
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
      ],
    );
  }
}
