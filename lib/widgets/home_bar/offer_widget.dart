import 'package:flutter/material.dart';
import 'package:perfit_app/screens/company_student_screens/company_details_screen.dart';
import 'package:perfit_app/screens/company_student_screens/student_details_screen.dart';

import '../../dummy_data.dart';
import '../../models/company.dart';
import '../../models/student.dart';

class OfferWidget extends StatelessWidget {
  final int index;
  final bool isStudent;

  //final List<Student> offeredStudents;

  //OfferWidget(this.offeredStudents);

  OfferWidget(this.index, this.isStudent);

  List<Company> listCompanies = DummyData.DUMMY_COMPANIES;
  List<Student> listStudents = DummyData.DUMMY_STUDENTS;

  @override
  Widget build(BuildContext context) {
    final studentName = listStudents[index].name;
    final companyId = listCompanies[index].name;
    return GestureDetector(
      onTap: () => isStudent
          ? Navigator.of(context)
              .pushNamed(CompanyDetailsScreen.routeName, arguments: companyId)
          : Navigator.of(context).pushNamed(StudentDetailsScreen.routeName,
              arguments: studentName),
      child: Container(
        //height: 150,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(3),
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //color: Theme.of(context).primaryColorDark,
                  color: Colors.black54,
                ),
                child: ClipOval(
                  child: Image.asset(
                    listStudents[index].profileURL,
                    height: 75,
                    width: 75,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  height: 140,
                  width: 200,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 20,
                        width: 140,
                        child: Text(
                          isStudent
                              ? listCompanies[index].name
                              : listStudents[index].name,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                isStudent
                                    ? 'Industry: ${listCompanies[index].industry}'
                                    : 'Course: ${listStudents[index].course}',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                isStudent
                                    ? 'Founder Name: ${listCompanies[index].founderName}'
                                    : 'School: ${listStudents[index].school}',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Text(
                              'Job Offered: Software Engineer Intern}',
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Date Offered: ${listCompanies[index].joinedDate}',
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
