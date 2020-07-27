import 'package:flutter/material.dart';

//import '../widgets/job_widget.dart';

class CourseJobScreen extends StatelessWidget {
  static const routeName = '/course_job_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
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
