import 'package:flutter/material.dart';

import '../models/jobs_for_interns.dart';
import '../widgets/dropdown_border.dart';
import '../widgets/textfield.dart';
import '../widgets/textfield_header.dart';
import './add_job_screen.dart';
import '../models/past_projects.dart';
import '../screens/successful_registration_screen.dart';

class EmployerRegistrationPage extends StatefulWidget {
  static const routeName = '/employerRegistationPage';

  @override
  _EmployerRegistrationPageState createState() =>
      _EmployerRegistrationPageState();
}

class _EmployerRegistrationPageState extends State<EmployerRegistrationPage> {
  String _industrySelected;
  bool _toShowPersonalNumber = false;
  List<JobForInterns> _jobForInterns = [];
  List<PastProjects> _pastProjects = [];

  List<String> _industries = [
    'Technology',
    'News Media',
    'Education',
    'Human Resource',
    'Advertising',
    'Communications',
    'Construction',
    'Entertainment',
    'Fashion',
    'Finance',
    'Hospitality',
    'Infrastructure',
    'Manufacturing',
    'Music',
    'Retail',
    'Service',
  ];

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
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Welcome to PerFit, let\'s get to know you!',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(height: 30),
            CustomTextField(
              context: context,
              labelText: 'Email',
              marginRight: 100,
              obscure: false,
              enableText: true,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 25),
            CustomTextField(
              context: context,
              labelText: 'Password',
              marginRight: 150,
              obscure: true,
              enableText: true,
            ),
            SizedBox(height: 25),
            CustomTextField(
              context: context,
              labelText: 'Retype password',
              marginRight: 150,
              obscure: true,
              enableText: true,
            ),
            SizedBox(height: 25),
            CustomTextField(
              context: context,
              labelText: 'Your name',
              marginRight: 100,
              obscure: false,
              enableText: true,
            ),
            SizedBox(height: 25),
            CustomTextField(
              context: context,
              labelText: 'Company name',
              marginRight: 100,
              obscure: false,
              enableText: true,
            ),
            SizedBox(height: 25),
            CustomTextField(
              context: context,
              labelText: 'Company address',
              marginRight: 100,
              obscure: false,
              enableText: true,
              maxLines: 3,
            ),
            SizedBox(height: 25),
            CustomTextField(
              context: context,
              labelText: 'Company registration number',
              marginRight: 100,
              obscure: false,
              enableText: true,
            ),
            SizedBox(height: 25),
            DropdownBorder(
                context: context,
                child: DropdownButtonFormField(
                  value: _industrySelected,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  hint: Text(
                    'Industry',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onChanged: (val) => setState(() {
                    this._industries = val;
                    print(this._industrySelected);
                  }),
                  items: _industries
                      .map(
                        (year) => DropdownMenuItem(
                          child: Text('$year'),
                          value: year,
                        ),
                      )
                      .toList(),
                )),
            SizedBox(height: 25),
            CustomTextField(
              context: context,
              labelText: 'Office number',
              marginRight: 180,
              obscure: false,
              enableText: true,
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 25),
            Stack(
              children: [
                Container(
                  child: CustomTextField(
                    context: context,
                    labelText: 'Personal number',
                    marginRight: 180,
                    obscure: false,
                    enableText: true,
                    textInputType: TextInputType.number,
                  ),
                ),
                Positioned(
                  right: 80,
                  top: 20,
                  child: Checkbox(
                    activeColor: Theme.of(context).primaryColor,
                    value: _toShowPersonalNumber,
                    onChanged: (value) {
                      setState(
                        () {
                          _toShowPersonalNumber = !_toShowPersonalNumber;
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 90,
                  child: Text(
                    'Show on profile',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            TextFieldHeader(context: context, header: 'About company'),
            SizedBox(height: 10),
            CustomTextField(
              context: context,
              labelText: '',
              marginRight: 100,
              obscure: false,
              enableText: true,
              maxLines: 5,
            ),
            SizedBox(height: 25),
            TextFieldHeader(
                context: context,
                header:
                    'What can interns hope to gain from \njoining your company?'),
            SizedBox(height: 10),
            CustomTextField(
              context: context,
              marginRight: 100,
              obscure: false,
              enableText: true,
              maxLines: 5,
            ),
            SizedBox(height: 25),
            TextFieldHeader(context: context, header: 'Jobs for interns'),
            SizedBox(height: 10),
            Container(
              height: 70.0 * _jobForInterns.length,
              margin: EdgeInsets.only(left: 30, right: 50),
              child: ListView.builder(
                itemCount: _jobForInterns.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        CustomTextField(
                          context: context,
                          labelText: _jobForInterns[index].jobTitle,
                          marginRight: 50.0,
                          marginLeft: 0.0,
                          obscure: false,
                          enableText: true,
                        ),
                        Positioned(
                          right: 0,
                          top: 10,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _jobForInterns.removeAt(
                                      index); //REMINDER: Need to use key here
                                  print(index);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30),
              child: IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(AddJobPage.routeName);
                  setState(
                    () {
                      if (result != null) {
                        this._jobForInterns.add(result);
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            TextFieldHeader(context: context, header: 'Past projects'),
            SizedBox(height: 10),
            Container(
              height: 70.0 * _pastProjects.length,
              margin: EdgeInsets.only(left: 30, right: 50),
              child: ListView.builder(
                itemCount: _pastProjects.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        CustomTextField(
                          context: context,
                          labelText: 'Project name and short description',
                          marginRight: 50.0,
                          marginLeft: 0.0,
                          obscure: false,
                          enableText: true,
                        ),
                        Positioned(
                          right: 0,
                          top: 10,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _pastProjects.removeAt(
                                      index); //REMINDER: Need to use key here
                                  print(index);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30),
              child: IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  setState(
                    () {
                      _pastProjects.add(
                        PastProjects(''),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            TextFieldHeader(
              context: context,
              header: 'Upload personal profile\n[docx,pdf,ppt][Optional]',
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30),
              child: IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  setState(
                    () {},
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 100,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SuccessfulRegistration.routeName);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).accentColor),
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
