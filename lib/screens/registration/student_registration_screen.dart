import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './successful_registration_screen.dart';
import '../../models/past_projects.dart';
import '../../widgets/flat_icon_button.dart';
import '../../models/skillsets.dart';
import '../../models/work_experience.dart';
import '../../widgets/dropdown_border.dart';
import '../../widgets/textfield_header.dart';
import '../../widgets/dynamic_field.dart';
import '../../dummy_data.dart';

class StudentRegistrationPage extends StatefulWidget {
  static const routeName = '/studentRegistrationPage';

  @override
  _StudentRegistrationPageState createState() =>
      _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage> {
  String _email;
  String _password;
  String _retypePassword;
  String _name;
  String _shortDescription;
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
        print(DateFormat('ddMMyyyy').format(_dateSelected));
      });
    });
    print('...');
  }

  void _deleteField(List list, String id) {
    setState(() {
      list.removeWhere((item) => item.id == id);
      for (int i = 0; i < list.length; i++) {
        print(list[i].id);
      }
    });
  }

  Widget _buildTextField({
    @required marginRight,
    @required obscure,
    @required enableText,
    @required function,
    marginLeft = 30.0,
    labelText = '',
    textInputType = TextInputType.text,
    maxLines = 1,
  }) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, right: marginRight),
      child: TextFormField(
        readOnly: !enableText,
        obscureText: obscure,
        maxLines: maxLines,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        onChanged: function,
      ),
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
            _buildTextField(
              function: (val) {
                _email = val;
                print('email: $_email');
              },
              labelText: 'Email',
              marginRight: 100.0,
              obscure: false,
              enableText: true,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 25),
            _buildTextField(
              function: (val) {
                _password = val;
                // print(_email);
                print(_password);
              },
              labelText: 'Password',
              marginRight: 150.0,
              obscure: true,
              enableText: true,
            ),
            SizedBox(height: 25),
            _buildTextField(
              function: (val) {
                _retypePassword = val;
                print(_retypePassword);
              },
              labelText: 'Retype password',
              marginRight: 150.0,
              obscure: true,
              enableText: true,
            ),
            SizedBox(height: 25),
            _buildTextField(
              function: (val) {
                _name = val;
                print(_name);
              },
              labelText: 'Name',
              marginRight: 100.0,
              obscure: false,
              enableText: true,
            ),
            SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 200,
              ),
              padding: const EdgeInsets.only(left: 14),
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
            TextFieldHeader(context: context, header: 'Gender'),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
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
                items: DummyData()
                    .genders
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
            TextFieldHeader(context: context, header: 'Availability'),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 40),
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
                      items: DummyData()
                          .months
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
                      items: DummyData()
                          .months
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
            DropdownBorder(
                context: context,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _schoolSelected,
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
                    items: DummyData()
                        .schools
                        .map(
                          (school) => DropdownMenuItem(
                            child: Text(school),
                            value: school,
                          ),
                        )
                        .toList(),
                  ),
                )),
            SizedBox(height: 25),
            DropdownBorder(
                context: context,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _facultySelected,
                    isExpanded: true,
                    hint: Text(
                      'Faculty',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onChanged: (val) => setState(() {
                      this._facultySelected = val;
                      this._courseSelected = null;
                      this._specialisationSelected = null;
                      print(_facultySelected);
                    }),
                    items: _schoolSelected != null
                        ? DummyData()
                            .faculties[_schoolSelected]
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
                )),
            SizedBox(height: 25),
            DropdownBorder(
                context: context,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: this._courseSelected,
                    isExpanded: true,
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
                        : DummyData()
                            .courses[_facultySelected]
                            .map(
                              (course) => DropdownMenuItem(
                                child: Text(course),
                                value: course,
                              ),
                            )
                            .toList(),
                  ),
                )),
            SizedBox(height: 25),
            DropdownBorder(
                context: context,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _specialisationSelected,
                    isExpanded: true,
                    hint: Text(
                      'Specialisation',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onChanged: (val) => setState(() {
                      this._specialisationSelected = val;
                      print(this._specialisationSelected);
                    }),
                    items: _courseSelected == null ||
                            _courseSelected == _errorMessage
                        ? [
                            DropdownMenuItem(
                              child: Text(
                                _errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                              value: _errorMessage,
                            ),
                          ]
                        : DummyData()
                            .specialisations[_courseSelected]
                            .map(
                              (specialisation) => DropdownMenuItem(
                                child: Text(specialisation),
                                value: specialisation,
                              ),
                            )
                            .toList(),
                  ),
                )),
            SizedBox(height: 25),
            DropdownBorder(
                context: context,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _yearOfStudySelected,
                    hint: Text(
                      'Year of study',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onChanged: (val) => setState(() {
                      this._yearOfStudySelected = val;
                      print(this._yearOfStudySelected);
                    }),
                    items: DummyData()
                        .yearOfStudy
                        .map(
                          (year) => DropdownMenuItem(
                            child: Text('$year'),
                            value: year,
                          ),
                        )
                        .toList(),
                  ),
                )),
            SizedBox(height: 25),
            TextFieldHeader(context: context, header: 'Skillsets'),
            SizedBox(height: 10),
            Container(
              height: 70.0 * _skillsets.length,
              margin: const EdgeInsets.only(left: 30, right: 50),
              child: ListView(
                children: _skillsets
                    .map(
                      (skillset) => DynamicField(
                        item: skillset,
                        key: ValueKey(skillset.id),
                        deleteField: _deleteField,
                        labelText:
                            'Skillset ${_skillsets.indexOf(skillset) + 1}',
                        list: _skillsets,
                        id: skillset.id,
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 30),
              child: IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _skillsets.add(Skillset('', DateTime.now().toString()));
                      print(DateTime.now().toString());
                      print(_skillsets.length);
                    });
                  }),
            ),
            SizedBox(height: 25),
            TextFieldHeader(context: context, header: 'Past projects'),
            SizedBox(height: 10),
            Container(
              height: 70.0 * _pastProjects.length,
              margin: const EdgeInsets.only(left: 30, right: 50),
              child: ListView(
                children: _pastProjects
                    .map(
                      (pastProject) => DynamicField(
                        item: pastProject,
                        key: ValueKey(pastProject.id),
                        deleteField: _deleteField,
                        labelText: 'Project name and short description',
                        list: _pastProjects,
                        id: pastProject.id,
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 30),
              child: IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _pastProjects
                          .add(PastProjects('', DateTime.now().toString()));
                      print(DateTime.now().toString());
                    });
                  }),
            ),
            SizedBox(height: 25),
            TextFieldHeader(context: context, header: 'Work experience'),
            SizedBox(height: 10),
            Container(
              height: 70.0 * _workExperiences.length,
              margin: const EdgeInsets.only(left: 30, right: 50),
              child: ListView(
                children: _workExperiences
                    .map(
                      (workExperience) => DynamicField(
                        item: workExperience,
                        key: ValueKey(workExperience.id),
                        deleteField: _deleteField,
                        labelText: 'Job title and short description',
                        list: _workExperiences,
                        id: workExperience.id,
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 30),
              child: IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _workExperiences
                          .add(WorkExperience('', DateTime.now().toString()));
                    });
                  }),
            ),
            SizedBox(height: 25),
            TextFieldHeader(
                context: context, header: 'Short description of yourself'),
            _buildTextField(
              function: (val) {
                _shortDescription = val;
                print(_shortDescription);
              },
              marginRight: 80.0,
              obscure: false,
              enableText: true,
              maxLines: 3,
            ),
            SizedBox(height: 25),
            TextFieldHeader(
                context: context, header: 'Upload personal CV file [Optional]'),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 30),
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
            TextFieldHeader(
                context: context, header: 'Upload profile picture [Optional]'),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 30),
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
