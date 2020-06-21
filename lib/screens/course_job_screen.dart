import 'package:flutter/material.dart';

import '../widgets/job_widget.dart';

class CourseJobScreen extends StatelessWidget {
  static const routeName = '/course_job_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PerFit!'),),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return JobWidget();
      })
    );
      
  }
}