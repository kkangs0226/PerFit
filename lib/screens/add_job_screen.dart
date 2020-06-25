import 'package:flutter/material.dart';

import '../models/jobs_for_interns.dart';
import '../models/jobs_for_interns_list.dart';

class AddJobPage extends StatefulWidget {
  static const routeName = '/addJobPage';

  @override
  _AddJobPageState createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  var job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          'PerFit',
          style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 20,
                color: Theme.of(context).accentColor,
              ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() {
                  job = JobForInterns(
                      jobTitle: 'hello',
                      jobSpecialisation: null,
                      jobDescription: null,
                      fullTime: null,
                      partTime: null,
                      salary: null);
                });
              },
              child: Text('submit'),
            ),
            SizedBox(height: 25),
            FlatButton(
              onPressed: () {
                Navigator.pop(context,
                    job); //Need to find solution to render previous page
              },
              child: Text('try me'),
            ),
          ],
        ),
      ),
    );
  }
}
