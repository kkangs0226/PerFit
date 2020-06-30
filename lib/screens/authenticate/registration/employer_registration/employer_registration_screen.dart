import 'package:flutter/material.dart';

import '../../../../models/jobs_for_interns.dart';
import '../../../../widgets/textfield_header.dart';
import './add_job_screen.dart';
import '../../../../widgets/dynamic_field.dart';
import '../../../../dummy_data.dart';
import '../../../../services/auth.dart';
import '../../../../widgets/loading.dart';
import '../../../../widgets/dropdownfield.dart';
import '../../../../widgets/textfield.dart';

class EmployerRegistrationPage extends StatefulWidget {
  static const routeName = '/employerRegistationPage';

  @override
  _EmployerRegistrationPageState createState() =>
      _EmployerRegistrationPageState();
}

class _EmployerRegistrationPageState extends State<EmployerRegistrationPage> {
  String _email = '';
  String _password = '';
  String _retypePassword = '';
  String _name;
  String _companyName;
  String _companyAddress;
  String _companyRegistrationNumber;
  int _officeNumber;
  int _personalNumber;
  String _aboutCompany;
  String _internsGain;
  String _industrySelected;
  bool _toShowPersonalNumber = false;
  bool _registrationError = false;
  bool _failedRegistration = false;
  bool _loading = false;
  bool _pastProjectsEmpty = false;
  List<Map<String, dynamic>> _jobForInterns = [];
  List<Map<String, String>> _pastProjects = [];
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  void _deleteField(List list, String id) {
    setState(() {
      list.removeWhere((item) => item['id'] == id);
      for (int i = 0; i < list.length; i++) {
        print(list[i]['id']);
      }
    });
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
                          _email = val;
                          print(_email);
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
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      labelText: 'Your name',
                      marginRight: 100.0,
                      obscure: false,
                      enableText: true,
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      initValue: _companyName,
                      function: (val) {
                        _companyName = val;
                        print(_companyName);
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter company\'s name';
                        }
                        return null;
                      },
                      labelText: 'Company name',
                      marginRight: 100.0,
                      obscure: false,
                      enableText: true,
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      initValue: _companyAddress,
                      function: (val) {
                        _companyAddress = val;
                        print(_companyAddress);
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter company\'s address';
                        }
                        return null;
                      },
                      labelText: 'Company address',
                      marginRight: 100.0,
                      obscure: false,
                      enableText: true,
                      maxLines: 3,
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      initValue: _companyRegistrationNumber,
                      function: (val) {
                        _companyRegistrationNumber = val;
                        print(_companyRegistrationNumber);
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter company\'s registration number';
                        }
                        return null;
                      },
                      labelText: 'Company registration number',
                      marginRight: 100.0,
                      obscure: false,
                      enableText: true,
                    ),
                    SizedBox(height: 25),
                    CustomDropdownField(
                      hintText: 'Industry',
                      items: DummyData()
                          .industries
                          .map(
                            (year) => DropdownMenuItem(
                              child: Text('$year'),
                              value: year,
                            ),
                          )
                          .toList(),
                      onChanged: (val) => setState(
                        () {
                          this._industrySelected = val;
                          print(this._industrySelected);
                        },
                      ),
                      value: _industrySelected,
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      initValue: _officeNumber == null ? '' : '$_officeNumber',
                      function: (val) {
                        _officeNumber = int.parse(val);
                        print(_officeNumber);
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter office number';
                        }
                        return null;
                      },
                      labelText: 'Office number',
                      marginRight: 180.0,
                      obscure: false,
                      enableText: true,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 25),
                    Stack(
                      children: [
                        Container(
                          child: CustomTextField(
                            initValue: _personalNumber == null
                                ? ''
                                : '$_personalNumber',
                            function: (val) {
                              _personalNumber = int.parse(val);
                              print(_personalNumber);
                            },
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please enter personal number';
                              }
                              return null;
                            },
                            labelText: 'Personal number',
                            marginRight: 180.0,
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
                                  _toShowPersonalNumber =
                                      !_toShowPersonalNumber;
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
                    TextFieldHeader(
                      context: context,
                      header: 'Company logo',
                    ),
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
                            () {},
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    TextFieldHeader(
                      context: context,
                      header: 'About company',
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      initValue: _aboutCompany,
                      function: (val) {
                        _aboutCompany = val;
                        print(_aboutCompany);
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please describe your company';
                        }
                        return null;
                      },
                      labelText: '',
                      marginRight: 100.0,
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
                      initValue: _internsGain,
                      function: (val) {
                        _internsGain = val;
                        print(_internsGain);
                      },
                      marginRight: 100.0,
                      obscure: false,
                      enableText: true,
                      maxLines: 5,
                    ),
                    SizedBox(height: 25),
                    TextFieldHeader(
                      context: context,
                      header: 'Jobs for interns',
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 70.0 * _jobForInterns.length,
                      margin: const EdgeInsets.only(left: 30, right: 50),
                      child: ListView(
                        children: _jobForInterns
                            .map(
                              (job) => DynamicField(
                                function: null,
                                item: job['jobTitle'],
                                key: ValueKey(job['id']),
                                deleteField: _deleteField,
                                labelText: job['jobTitle'],
                                list: _jobForInterns,
                                id: job['id'],
                                enableText: false,
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
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          final result = await Navigator.of(context)
                              .pushNamed(AddJobPage.routeName);
                          setState(
                            () {
                              _loading = false;
                              if (result != null) {
                                JobForInterns job = result;
                                print(job.jobTitle);
                                this._jobForInterns.add(
                                  {
                                    'jobTitle': job.jobTitle,
                                    'jobSpec': job.jobSpecialisation,
                                    'duration': job.duration,
                                    'id': job.id,
                                    'jobDesc': job.jobDescription,
                                    'skillsets': job.jobRequirements,
                                    'fullTime': job.fullTime,
                                    'partTime': job.partTime,
                                    'salary': job.salary,
                                    'endMonth': job.endMonth,
                                    'startMonth': job.startMonth,
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
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
                                item: pastProject['pastProj'],
                                key: ValueKey(pastProject['id']),
                                deleteField: _deleteField,
                                labelText: 'Project name and short description',
                                list: _pastProjects,
                                id: pastProject['id'],
                                function: (val) {
                                  pastProject['pastProj'] = val;
                                },
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
                          setState(
                            () {
                              _pastProjects.add({
                                'pastProj': '',
                                'id': DateTime.now().toString(),
                              });
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    TextFieldHeader(
                      context: context,
                      header:
                          'Upload personal profile\n[docx,pdf,ppt][Optional]',
                    ),
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
                            () {},
                          );
                        },
                      ),
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
                    if (_pastProjectsEmpty)
                      Text(
                        'Please ensure all past projects fields are filled',
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      width: 100,
                      child: FlatButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            for (int i = 0; i < _pastProjects.length; i++) {
                              if (_pastProjects[i]['pastProj'] == '') {
                                setState(
                                  () {
                                    _registrationError = false;
                                    _pastProjectsEmpty = true;
                                  },
                                );
                                break;
                              }
                              _pastProjectsEmpty = false;
                            }
                            if (_pastProjectsEmpty == false) {
                              setState(() {
                                _loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                email: _email,
                                password: _password,
                                employer: true,
                                name: _name,
                                companyName: _companyName,
                                companyAdd: _companyAddress,
                                companyRegNo: _companyRegistrationNumber,
                                industry: _industrySelected,
                                officeNum: _officeNumber,
                                personalNum: _personalNumber,
                                personalNumOnProf: _toShowPersonalNumber,
                                aboutCompany: _aboutCompany,
                                internsGain: _internsGain,
                                jobsForInterns: _jobForInterns,
                                pastProj: _pastProjects,
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
