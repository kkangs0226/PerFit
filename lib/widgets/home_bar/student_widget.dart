import 'package:flutter/material.dart';

import 'package:perfit_app/dummy_data.dart';

import '../../screens/company_student_screens/student_details_screen.dart';
import '../../models/student.dart';

class StudentWidget extends StatelessWidget {
  final int index;

  StudentWidget(this.index);

  List<Student> listStudents = DummyData.DUMMY_STUDENTS;

  @override
  Widget build(BuildContext context) {
    //Widget _buildText(String)

    final studentName = listStudents[index].name;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        StudentDetailsScreen.routeName,
        arguments: studentName,
        //arguments: companyId,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(3),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //color: Theme.of(context).primaryColorDark,
              color: Colors.black54,
            ),
            child: ClipOval(
              child: Image.asset(
                listStudents[index].profileURL,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 130,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  '${listStudents[index].name}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Course: ${listStudents[index].course}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'School: ${listStudents[index].school}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
              //Text('Course: ${listStudents[index].course}')
            ),
          ),
        ],
      ),
    );
  }
}
