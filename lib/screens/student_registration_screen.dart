import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/successful_registration_screen.dart';
import '../models/past_projects.dart';
import '../widgets/flat_icon_button.dart';
import '../widgets/textfield.dart';
import '../models/skillsets.dart';
import '../models/work_experience.dart';

class StudentRegistrationPage extends StatefulWidget {
  static const routeName = '/studentRegistrationPage';

  @override
  _StudentRegistrationPageState createState() =>
      _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage> {
  DateTime _dateSelected;
  String _schoolSelected;
  String _startDateSelected;
  String _endDateSelected;
  String _facultySelected;
  String _genderSelected;
  int _yearOfStudySelected;
  String _courseSelected;
  String _specialisationSelected;
  String _errorMessage = 'Please fill the previous field first';
  List<PastProjects> _pastProjects = [];
  List<Skillset> _skillsets = [];
  List<WorkExperience> _workExperiences = [];

  final _yearOfStudy = [1, 2, 3, 4, 5];

  final _genders = ['Male', 'Female'];

  final Map<String, List<String>> _specialisations = {
    'Information Systems': [
      'None',
      'Fintech',
      'Digital Innovation',
      'Ecommerce',
    ],
    'Computer Science': [
      'None',
      'AI',
      'Machine Learning',
      'Game development',
    ],
    'Economics': [
      'None',
      'Macro',
      'Micro',
    ],
    'Communications and News Media': [
      'None',
      'Social Media',
      'Newspaper',
    ],
    'Environmental Engineering': [
      'None',
    ],
    'Chemical Engineering': [
      'None',
    ],
    'Data Science': [
      'None',
    ],
    'Mathematics': [
      'None',
    ],
    'Accountancy': [
      'None',
    ],
  };

  final Map<String, List<String>> _courses = {
    'Computing': ['Information Systems', 'Computer Science'],
    'FASS': ['Economics', 'Communications and News Media'],
    'Engineering': ['Environmental Engineering', 'Chemical Engineering'],
    'Science': ['Data Science', 'Mathematics'],
    'Business': ['Accountancy'],
  };

  final _months = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  final _schools = [
    'NUS',
    'NTU',
    'SIM',
    'SMU',
    'SP',
    'TP',
    'RP',
  ];

  final Map<String, List<String>> _faculties = {
    'NUS': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'NTU': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'SIM': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'SMU': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'SP': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'TP': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'RP': [
      'Computing',
      'FASS',
    ],
  };

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dateSelected = pickedDate;
      });
    });
    print('...');
  }

  Widget _buildDropdownBorder(Widget child) {
    return Container(
      width: double.infinity,
      height: 55,
      margin: EdgeInsets.only(left: 30, right: 180),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: child,
    );
  }

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
              labelText: 'Name',
              marginRight: 100,
              obscure: false,
              enableText: true,
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(
                left: 30,
                right: 200,
              ),
              padding: EdgeInsets.only(left: 14),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _dateSelected == null
                          ? 'Date of birth'
                          : DateFormat('dd/MM/yyyy').format(_dateSelected),
                      style: TextStyle(
                        color: _dateSelected == null
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomFlatButtonIcon(
                      '',
                      _presentDatePicker,
                      Icon(Icons.calendar_today),
                      70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Gender',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 40,
                right: 270,
              ),
              child: DropdownButtonFormField(
                hint: Text(
                  'Choose',
                ),
                onChanged: (val) => setState(() {
                  this._genderSelected = val;
                  print(this._genderSelected);
                }),
                items: _genders
                    .map(
                      (gender) => DropdownMenuItem(
                        child: Text(gender),
                        value: gender,
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Availabilty',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    child: DropdownButtonFormField(
                      hint: Text('Start'),
                      onChanged: (val) => setState(() {
                        this._startDateSelected = val;
                        print(this._startDateSelected.toString());
                      }),
                      items: _months
                          .map(
                            (month) => DropdownMenuItem(
                              child: Text(month),
                              value: month,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    width: 80,
                    child: DropdownButtonFormField(
                      hint: Text('End'),
                      onChanged: (val) => setState(() {
                        this._endDateSelected = val;
                        print(_endDateSelected.toString());
                      }),
                      items: _months
                          .map(
                            (month) => DropdownMenuItem(
                              child: Text(month),
                              value: month,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            _buildDropdownBorder(
              DropdownButtonFormField(
                value: _schoolSelected,
                decoration: InputDecoration.collapsed(hintText: ''),
                hint: Text(
                  'University/Polytechnic',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onChanged: (val) => setState(() {
                  this._schoolSelected = val;
                  this._facultySelected = null;
                  this._courseSelected = null;
                  this._specialisationSelected = null;
                  print(this._courseSelected);
                  print(this._schoolSelected);
                }),
                items: _schools
                    .map(
                      (school) => DropdownMenuItem(
                        child: Text(school),
                        value: school,
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 25),
            _buildDropdownBorder(
              DropdownButtonFormField(
                value: _facultySelected,
                isExpanded: true,
                decoration: InputDecoration.collapsed(hintText: ''),
                hint: Text(
                  'Faculty',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onChanged: (val) => setState(() {
                  print(_courseSelected);
                  this._facultySelected = val;
                  this._courseSelected = null;
                  this._specialisationSelected = null;
                  print(_courseSelected);
                }),
                items: _schoolSelected != null
                    ? _faculties[_schoolSelected]
                        .map(
                          (faculty) => DropdownMenuItem(
                            child: Text(faculty),
                            value: faculty,
                          ),
                        )
                        .toList()
                    : [
                        DropdownMenuItem(
                          child: Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                          value: _errorMessage,
                        ),
                      ],
              ),
            ),
            SizedBox(height: 25),
            _buildDropdownBorder(
              DropdownButtonFormField(
                value: this._courseSelected,
                isExpanded: true,
                decoration: InputDecoration.collapsed(hintText: ''),
                hint: Text(
                  'Course',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onChanged: (val) => setState(() {
                  this._courseSelected = val;
                  this._specialisationSelected = null;
                  print(this._courseSelected);
                }),
                items: _facultySelected == null ||
                        _facultySelected == _errorMessage
                    ? [
                        DropdownMenuItem(
                          child: Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                          value: _errorMessage,
                        ),
                      ]
                    : _courses[_facultySelected]
                        .map(
                          (course) => DropdownMenuItem(
                            child: Text(course),
                            value: course,
                          ),
                        )
                        .toList(),
              ),
            ),
            SizedBox(height: 25),
            _buildDropdownBorder(
              DropdownButtonFormField(
                value: _specialisationSelected,
                isExpanded: true,
                decoration: InputDecoration.collapsed(hintText: ''),
                hint: Text(
                  'Specialisation',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onChanged: (val) => setState(() {
                  this._specialisationSelected = val;
                  print(this._specialisationSelected);
                }),
                items:
                    _courseSelected == null || _courseSelected == _errorMessage
                        ? [
                            DropdownMenuItem(
                              child: Text(
                                _errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                              value: _errorMessage,
                            ),
                          ]
                        : _specialisations[_courseSelected]
                            .map(
                              (specialisation) => DropdownMenuItem(
                                child: Text(specialisation),
                                value: specialisation,
                              ),
                            )
                            .toList(),
              ),
            ),
            SizedBox(height: 25),
            _buildDropdownBorder(
              DropdownButtonFormField(
                value: _yearOfStudySelected,
                decoration: InputDecoration.collapsed(hintText: ''),
                hint: Text(
                  'Year of study',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onChanged: (val) => setState(() {
                  this._yearOfStudySelected = val;
                  print(this._yearOfStudySelected);
                }),
                items: _yearOfStudy
                    .map(
                      (year) => DropdownMenuItem(
                        child: Text('$year'),
                        value: year,
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Skillsets',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 70.0 * _skillsets.length,
              margin: EdgeInsets.only(left: 30, right: 50),
              child: ListView.builder(
                itemCount: _skillsets.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        CustomTextField(
                          context: context,
                          labelText: 'Skillset ${(index + 1)}',
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
                                  _skillsets.removeAt(
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
                    setState(() {
                      _skillsets.add(Skillset(''));
                    });
                  }),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Past projects',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 90.0 * _pastProjects.length,
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
                          maxLines: 2,
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
                    setState(() {
                      _pastProjects.add(PastProjects(''));
                    });
                  }),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Work experience',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 90.0 * _workExperiences.length,
              margin: EdgeInsets.only(left: 30, right: 50),
              child: ListView.builder(
                itemCount: _workExperiences.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        CustomTextField(
                          context: context,
                          marginRight: 50.0,
                          marginLeft: 0.0,
                          obscure: false,
                          enableText: true,
                          maxLines: 2,
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
                                  _workExperiences.removeAt(
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
                    setState(() {
                      _workExperiences.add(WorkExperience(''));
                    });
                  }),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Short description of yourself',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ),
            CustomTextField(
              context: context,
              marginRight: 80,
              obscure: false,
              enableText: true,
              maxLines: 3,
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Upload personal CV file [Optional]',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
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
                        () {}); // Reminder: need to access user's local files
                  }),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Upload profile picture [Optional]',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
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
                        () {}); // Reminder: need to access user's local files
                  }),
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
