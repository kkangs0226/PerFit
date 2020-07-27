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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../chat_bar/chat_screen.dart';
import '../../../models/chat.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  final bool isEmployer;
  final DocumentSnapshot currentUser;
  final bool notSignedIn;

  HomeScreen(this.isEmployer, this.currentUser, this.notSignedIn);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseUser currentUser;

  //List<Map<String, String>> _courseName = [];

  bool isStudent;

  @override
  void initState() {
    super.initState();
    isStudent = !widget.isEmployer;
  }

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
    return widgetList.length == 0
        ? Container(
            height: 200,
            width: double.infinity,
            child: Container(
              child: Image.asset(
                'assets/images/no_favourites.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container(
            height: 200,
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widgetList.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: widgetList[i],
                child: CompanyWidget(),
              ),

              //itemBuilder: (ctx, i) => ,
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

  Widget _offerListBuilderCompanies(Map<String, OfferItem> widgetList) {
    return widgetList.length == 0
        ? Container(
            height: 200,
            width: double.infinity,
            child: Container(
              child: Image.asset(
                'assets/images/no_offers.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container(
            height: 200,
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widgetList.length,
              itemBuilder: (ctx, i) {
                return ChangeNotifierProvider.value(
                  value: Provider.of<CompaniesList>(context)
                      .LIST_COMPANIES
                      .firstWhere((company) =>
                          company.id ==
                          widgetList.values.toList()[i].companyId),
                  child: OfferWidget(true),
                );
              },
            ),
          );
  }

  Widget _offerListBuilderStudents(Map<String, OfferItem> offeredStudents) {
    return offeredStudents.length == 0
        ? Container(
            height: 200,
            width: double.infinity,
            child: Container(
              child: Image.asset(
                'assets/images/offers.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container(
            height: 200,
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offeredStudents.length,
              itemBuilder: (ctx, i) {
                return ChangeNotifierProvider.value(
                  value: Provider.of<StudentsList>(context)
                      .LIST_STUDENTS
                      .firstWhere((student) =>
                          student.name ==
                          offeredStudents.values.toList()[i].studentId),
                  child: OfferWidget(false),
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
            CourseWidget('COM', widget.isEmployer),
            CourseWidget('BIZ', widget.isEmployer),
            CourseWidget('ARTS', widget.isEmployer),
            CourseWidget('SCI', widget.isEmployer),
            CourseWidget('ENG', widget.isEmployer),
          ],
        ),
        Heading('NEW', isStudent),
        isStudent
            ? _companyListBuilder(companiesList.LIST_COMPANIES)
            : NewStudentsJoined(),
        Heading('OFFER', isStudent),
        isStudent
            ? _offerListBuilderCompanies(offers.offerListCompanies)
            : _offerListBuilderStudents(offers.offerListStudents),
        SizedBox(height: 50, width: 50),
        Heading('FAVOURITES', isStudent),
        isStudent
            ? _companyListBuilder(companiesList.favouriteCompanies)
            : _studentListBuilder(studentsList.LIST_STUDENTS),
        SizedBox(
          height: 25,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: widget.isEmployer
              ? Firestore.instance.collection('students').snapshots()
              : Firestore.instance.collection('employers').snapshots(),
          builder: (ctx, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            print(snapshots.data.documents.length);
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              height: snapshots.data.documents.length * 100.0,
              child: ListView.builder(
                itemCount: snapshots.data.documents.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Text(snapshots.data.documents[index]['name']),
                      RaisedButton.icon(
                        onPressed: () {
                          // print(snapshots.data.documents[index]
                          //     ['profile_image']);
                          String imageUrl = !widget.isEmployer
                              ? snapshots.data.documents[index]['logo']
                              : snapshots.data.documents[index]
                                  ['profile_image'];
                          Navigator.of(context).pushNamed(
                            ChatScreen.routeName,
                            arguments: Chat(
                              snapshots.data.documents[index].documentID,
                              snapshots.data.documents[index]['name'],
                              widget.isEmployer,
                              imageUrl,
                            ),
                          );
                        },
                        icon: Icon(Icons.send),
                        label: Text('send'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
