import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/flat_icon_button.dart';
import '../../../../widgets/textfield_header.dart';
import '../../../../widgets/dynamic_field.dart';
import '../../../../dummy_data.dart';
import '../../../../services/auth.dart';
import '../../../../widgets/loading.dart';
import '../../../../widgets/textfield.dart';
import '../../../../widgets/dropdownfield.dart';

class StudentRegistrationPage extends StatefulWidget {
  static const routeName = '/studentRegistrationPage';

  @override
  _StudentRegistrationPageState createState() =>
      _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage> {
  String _email = '';
  String _password = '';
  String _retypePassword = '';
  String _name;
  String _shortDescription;
  String _dateSelected;
  String _schoolSelected;
  String _startDateSelected;
  String _endDateSelected;
  String _facultySelected;
  String _genderSelected;
  int _yearOfStudySelected;
  String _courseSelected;
  String _specialisationSelected;
  String _errorMessage = 'Please fill the previous field first';
  bool _registrationError = false;
  bool _failedRegistration = false;
  bool _loading = false;
  bool _emptySkillsetField = false;
  bool _emptyPastProjField = false;
  bool _emptyWorkExpField = false;
  List<Map<String, String>> _pastProjects = [];
  List<Map<String, String>> _skillsets = [];
  List<Map<String, String>> _workExperiences = [];
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

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
        _dateSelected = DateFormat('dd/MM/yyyy').format(pickedDate);
        print(_dateSelected);
      });
    });
    print('...');
  }

  void _deleteField(List list, String id) {
    setState(() {
      list.removeWhere((item) => item['id'] == id);
      for (int i = 0; i < list.length; i++) {
        print(list[i]['id']);
      }
    });
  }

  Widget _buildAddButton({Function onPressed}) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 30),
      child: IconButton(
        icon: Icon(
          Icons.add_circle_outline,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : Scaffold(
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
              child: Form(
                key: _formKey,
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
                        initValue: _email,
                        function: (val) {
                          setState(() {
                            _email = val;
                          });
                          print('email: $_email');
                        },
                        labelText: 'Email',
                        marginRight: 100.0,
                        obscure: false,
                        enableText: true,
                        textInputType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val.isEmpty || !_email.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(height: 25),
                    CustomTextField(
                        initValue: _password,
                        function: (val) {
                          _password = val;
                          // print(_email);
                          print(_password);
                        },
                        labelText: 'Password',
                        marginRight: 150.0,
                        obscure: true,
                        enableText: true,
                        validator: (val) {
                          if (val.length < 6) {
                            return 'Please enter at least 6 characters';
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(height: 25),
                    CustomTextField(
                        initValue: _retypePassword,
                        function: (val) {
                          _retypePassword = val;
                          print(_retypePassword);
                        },
                        labelText: 'Retype password',
                        marginRight: 150.0,
                        obscure: true,
                        enableText: true,
                        validator: (val) {
                          if (val.isEmpty && _password.length >= 6) {
                            return 'Please retype password';
                          } else if (val != _password &&
                              _password.length >= 6) {
                            return 'Does not match password';
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(height: 25),
                    CustomTextField(
                        initValue: _name,
                        function: (val) {
                          _name = val;
                          print(_name);
                        },
                        labelText: 'Name',
                        marginRight: 100.0,
                        obscure: false,
                        enableText: true,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        }),
                    SizedBox(height: 25),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 200,
                      ),
                      padding: const EdgeInsets.only(left: 14),
                      height: 60,
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
                                  : _dateSelected,
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
                    TextFieldHeader(
                      context: context,
                      header: 'Gender',
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        left: 40,
                        right: 270,
                      ),
                      child: DropdownButtonFormField(
                        value: _genderSelected,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.red),
                        ),
                        validator: (val) {
                          if (val == null) {
                            return 'Please choose\na gender';
                          }
                          return null;
                        },
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
                    TextFieldHeader(
                      context: context,
                      header: 'Availability',
                    ),
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
                    CustomDropdownField(
                      value: _schoolSelected,
                      onChanged: (val) => setState(() {
                        this._schoolSelected = val;
                        this._facultySelected = null;
                        this._courseSelected = null;
                        this._specialisationSelected = null;
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
                      hintText: 'University/Polytechnic',
                    ),
                    SizedBox(height: 25),
                    CustomDropdownField(
                      hintText: 'Faculty',
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
                      onChanged: (val) => setState(
                        () {
                          this._facultySelected = val;
                          this._courseSelected = null;
                          this._specialisationSelected = null;
                          print(_facultySelected);
                        },
                      ),
                      value: _facultySelected,
                    ),
                    SizedBox(height: 25),
                    CustomDropdownField(
                      value: _courseSelected,
                      hintText: 'Course',
                      onChanged: (val) => setState(
                        () {
                          this._courseSelected = val;
                          this._specialisationSelected = null;
                          print(this._courseSelected);
                        },
                      ),
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
                    SizedBox(height: 25),
                    CustomDropdownField(
                      hintText: 'Specialisation',
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
                      onChanged: (val) => setState(
                        () {
                          this._specialisationSelected = val;
                          print(this._specialisationSelected);
                        },
                      ),
                      value: _specialisationSelected,
                    ),
                    SizedBox(height: 25),
                    CustomDropdownField(
                      hintText: 'Year of study',
                      items: DummyData()
                          .yearOfStudy
                          .map(
                            (year) => DropdownMenuItem(
                              child: Text('$year'),
                              value: year,
                            ),
                          )
                          .toList(),
                      onChanged: (val) => setState(
                        () {
                          this._yearOfStudySelected = val;
                          print(this._yearOfStudySelected);
                        },
                      ),
                      value: _yearOfStudySelected,
                    ),
                    SizedBox(height: 25),
                    TextFieldHeader(
                      context: context,
                      header: 'Skillsets',
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 70.0 * _skillsets.length,
                      margin: const EdgeInsets.only(left: 30, right: 50),
                      child: ListView(
                        children: _skillsets
                            .map(
                              (skillset) => DynamicField(
                                function: (val) {
                                  skillset['skillset'] = val;
                                  print(skillset['skillset']);
                                },
                                item: skillset['skillset'],
                                key: ValueKey(skillset['id']),
                                deleteField: _deleteField,
                                labelText:
                                    'Skillset ${_skillsets.indexOf(skillset) + 1}',
                                list: _skillsets,
                                id: skillset['id'],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    _buildAddButton(
                      onPressed: () {
                        setState(() {
                          _skillsets.add({
                            'skillset': '',
                            'id': DateTime.now().toString()
                          });
                          print(DateTime.now().toString());
                          print(_skillsets.length);
                        });
                      },
                    ),
                    SizedBox(height: 25),
                    TextFieldHeader(
                      context: context,
                      header: 'Past projects',
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 70.0 * _pastProjects.length,
                      margin: const EdgeInsets.only(left: 30, right: 50),
                      child: ListView(
                        children: _pastProjects
                            .map(
                              (pastProject) => DynamicField(
                                function: (val) {
                                  pastProject['pastProj'] = val;
                                },
                                item: pastProject['pastProj'],
                                key: ValueKey(pastProject['id']),
                                deleteField: _deleteField,
                                labelText: 'Project name and short description',
                                list: _pastProjects,
                                id: pastProject['id'],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    _buildAddButton(
                      onPressed: () {
                        setState(() {
                          _pastProjects.add({
                            'pastProj': '',
                            'id': DateTime.now().toString()
                          });
                          print(DateTime.now().toString());
                        });
                      },
                    ),
                    SizedBox(height: 25),
                    TextFieldHeader(
                        context: context, header: 'Work experience'),
                    SizedBox(height: 10),
                    Container(
                      height: 70.0 * _workExperiences.length,
                      margin: const EdgeInsets.only(left: 30, right: 50),
                      child: ListView(
                        children: _workExperiences
                            .map(
                              (workExperience) => DynamicField(
                                function: (val) {
                                  workExperience['workExp'] = val;
                                },
                                item: workExperience['workExp'],
                                key: ValueKey(workExperience['id']),
                                deleteField: _deleteField,
                                labelText: 'Job title and short description',
                                list: _workExperiences,
                                id: workExperience['id'],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    _buildAddButton(
                      onPressed: () {
                        setState(() {
                          _workExperiences.add(
                              {'workExp': '', 'id': DateTime.now().toString()});
                        });
                      },
                    ),
                    SizedBox(height: 25),
                    TextFieldHeader(
                        context: context,
                        header: 'Short description of yourself'),
                    CustomTextField(
                      initValue: _shortDescription,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please fill a short description';
                        }
                        return null;
                      },
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
                        context: context,
                        header: 'Upload personal CV file [Optional]'),
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
                        context: context,
                        header: 'Upload profile picture [Optional]'),
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
                    if (_failedRegistration)
                      Text(
                        'Please enter a valid email / email is already in use',
                        style: TextStyle(color: Colors.red),
                      ),
                    if (_registrationError)
                      Text(
                        ' Registration unsucessful\nPlease refer to above fields ',
                        style: TextStyle(color: Colors.red),
                      ),
                    if (_emptyPastProjField ||
                        _emptySkillsetField ||
                        _emptyWorkExpField)
                      Text(
                        '                             Please ensure that all\nskillsets/past projects/work experience fields are filled ',
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      width: 100,
                      child: FlatButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            for (int i = 0; i < _skillsets.length; i++) {
                              if (_skillsets[i]['skillset'] == '') {
                                setState(
                                  () {
                                    _registrationError = false;
                                    _emptySkillsetField = true;
                                  },
                                );
                                break;
                              }
                              _emptySkillsetField = false;
                            }
                            for (int i = 0; i < _pastProjects.length; i++) {
                              if (_pastProjects[i]['pastProj'] == '') {
                                setState(() {
                                  _registrationError = false;
                                  _emptyPastProjField = true;
                                });
                                break;
                              }
                              _emptyPastProjField = false;
                            }
                            for (int i = 0; i < _workExperiences.length; i++) {
                              if (_workExperiences[i]['workExp'] == '') {
                                setState(() {
                                  _registrationError = false;
                                  _emptyWorkExpField = true;
                                });
                                break;
                              }
                              _emptyWorkExpField = false;
                            }
                            if (_emptyWorkExpField == false &&
                                _emptyPastProjField == false &&
                                _emptySkillsetField == false) {
                              setState(() {
                                _loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                email: _email,
                                password: _password,
                                employer: false,
                                name: _name,
                                dob: _dateSelected,
                                gender: _genderSelected,
                                start: _startDateSelected,
                                end: _endDateSelected,
                                school: _schoolSelected,
                                faculty: _facultySelected,
                                course: _courseSelected,
                                spec: _specialisationSelected,
                                yearOfStudy: _yearOfStudySelected,
                                skillsets: _skillsets,
                                pastProj: _pastProjects,
                                workExp: _workExperiences,
                                shortDesc: _shortDescription,
                              );
                              if (result == null) {
                                setState(() {
                                  _loading = false;
                                  _failedRegistration = true;
                                  _registrationError = false;
                                });
                              } else {
                                Navigator.pop(context);
                              }
                            }
                          } else {
                            setState(() {
                              _failedRegistration = false;
                              _registrationError = true;
                            });
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          );
  }
}
