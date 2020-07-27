import 'package:flutter/material.dart';

//import '../widgets/job_widget.dart';

class CourseJobScreen extends StatefulWidget {
  static const routeName = '/course_job_screen';

  @override
  _CourseJobScreenState createState() => _CourseJobScreenState();
}

class _CourseJobScreenState extends State<CourseJobScreen> {
  @override
  Widget build(BuildContext context) {
    String courseId = ModalRoute.of(context).settings.arguments;
    String appBarTitle = '';

    switch (courseId) {
      case 'COM':
        appBarTitle = 'Computing';
        break;
      case 'BIZ':
        appBarTitle = 'Business';
        break;
      case 'ENG':
        appBarTitle = 'Engineering';
        break;
      case 'ARTS':
        appBarTitle = 'Arts';
        break;
      case 'SCI':
        appBarTitle = 'Science';
        break;
      default:
        appBarTitle = 'PerFit!';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      /* body: ListView.builder(itemBuilder: (ctx, index) {
        return JobWidget();
        }
        )
      */
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: Container(),
            ),
            Text('course'),
          ],
        ),
      ),
    );
  }
}
