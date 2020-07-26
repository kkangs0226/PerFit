import 'package:flutter/material.dart';
//import 'package:perfit_app/providers/students_list.dart';
//import 'package:perfit_app/dummy_data.dart';
import 'package:provider/provider.dart';

import '../../models/student.dart';
import '../../providers/offers.dart';
import '../../providers/students_list.dart';

class StudentDetailsScreen extends StatelessWidget {
  static const routeName = './student_details_screen';

  /*final Function toggleOffer;
  final Function gaveOffer;
  

  StudentDetailsScreen(this.toggleOffer, this.gaveOffer);
  */

  @override
  Widget build(BuildContext context) {
    final studentName = ModalRoute.of(context).settings.arguments as String;
    final selectedStudent = Provider.of<StudentsList>(
      context,
    ).findById(studentName);
    final offerList = Provider.of<Offers>(context, listen: false);
    //final selectedStudent = DummyData.DUMMY_STUDENTS[1];
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      selectedStudent.profileURL,
                      height: 120,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: mediaQueryData.size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 3, right: 10, left: 10),
                        child: Text(
                          'Name: ${selectedStudent.name}',
                          //'Name: djklajfdklfjlasdjfklasjf',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Course: ${selectedStudent.course}',
                              //'Name: djklajfdklfjlasdjfklasjf',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              //width: mediaQueryData.size.width * 0.4,
                              child: Text(
                                'School: ${selectedStudent.school}',
                                //'Name: djklajfdklfjlasdjfklasjf',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Text(
                              'Age: ${selectedStudent.age}',
                              //'Name: djklajfdklfjlasdjfklasjf',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              'Year: ${selectedStudent.year}',
                              //'Name: djklajfdklfjlasdjfklasjf',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: mediaQueryData.size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Personal Statement',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      child: Text(
                        '${selectedStudent.personalStatement}',
                        //'Name: djklajfdklfjlasdjfklasjf',
                        softWrap: true,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: mediaQueryData.size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'CV',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Card(
                        elevation: 10,
                        child: Image.asset(selectedStudent.resumeURL)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
                selectedStudent.gaveOffer
                    ? Icons.check
                    : Icons.accessibility_new,
                color: Theme.of(context).accentColor),
            onPressed: () {
              selectedStudent.toggleOffer();
              if (selectedStudent.gaveOffer) {
                offerList.addOfferStudent(
                    selectedStudent.name, selectedStudent.name);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('You gave an offer to ${selectedStudent.name}!'),
                    duration: Duration(
                      seconds: 2,
                    ),
                  ),
                );
              } else {
                offerList.cancelOfferStudent(selectedStudent.name);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'You cancelled your offer to ${selectedStudent.name}!'),
                    duration: Duration(
                      seconds: 2,
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
