import 'package:flutter/material.dart';

import '../../../../models/jobs_for_interns.dart';
import '../../../../widgets/dropdown_border.dart';
import '../../../../widgets/textfield_header.dart';
import './add_job_screen.dart';
import '../../../../widgets/dynamic_field.dart';
import '../../../../dummy_data.dart';
import '../../../../services/auth.dart';
import '../../../../widgets/loading.dart';

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
  List<Map<String, dynamic>> _jobForInterns = [];
  List<Map<String, String>> _pastProjects = [];
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  Widget _buildTextField({
    @required marginRight,
    @required obscure,
    @required enableText,
    @required function,
    validator,
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
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        onChanged: function,
        validator: validator,
      ),
    );
  }

  void _deleteField(List list, String id) {
    setState(() {
      list.removeWhere((item) => item['id'] == id);
      for (int i = 0; i < list.length; i++) {
        print(list[i]['id']);
      }
    });
  }

  void _updateValueOfListFields(String val, int index, List list, String key) {
    list[index][key] = val;
    print(val);
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
                    _buildTextField(
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
                    _buildTextField(
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
                    _buildTextField(
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
                    _buildTextField(
                      function: (val) {
                        _name = val;
                        print(_name);
                      },
                      labelText: 'Your name',
                      marginRight: 100.0,
                      obscure: false,
                      enableText: true,
                    ),
                    SizedBox(height: 25),
                    _buildTextField(
                      function: (val) {
                        _companyName = val;
                        print(_companyName);
                      },
                      labelText: 'Company name',
                      marginRight: 100.0,
                      obscure: false,
                      enableText: true,
                    ),
                    SizedBox(height: 25),
                    _buildTextField(
                      function: (val) {
                        _companyAddress = val;
                        print(_companyAddress);
                      },
                      labelText: 'Company address',
                      marginRight: 100.0,
                      obscure: false,
                      enableText: true,
                      maxLines: 3,
                    ),
                    SizedBox(height: 25),
                    _buildTextField(
                      function: (val) {
                        _companyRegistrationNumber = val;
                        print(_companyRegistrationNumber);
                      },
                      labelText: 'Company registration number',
                      marginRight: 100.0,
                      obscure: false,
                      enableText: true,
                    ),
                    SizedBox(height: 25),
                    DropdownBorder(
                        context: context,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: _industrySelected,
                            hint: Text(
                              'Industry',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            onChanged: (val) => setState(() {
                              this._industrySelected = val;
                              print(this._industrySelected);
                            }),
                            items: DummyData()
                                .industries
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
                    _buildTextField(
                      function: (val) {
                        _officeNumber = int.parse(val);
                        print(_officeNumber);
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
                          child: _buildTextField(
                            function: (val) {
                              _personalNumber = int.parse(val);
                              print(_personalNumber);
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
                    TextFieldHeader(context: context, header: 'Company logo'),
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
                    TextFieldHeader(context: context, header: 'About company'),
                    SizedBox(height: 10),
                    _buildTextField(
                      function: (val) {
                        _aboutCompany = val;
                        print(_aboutCompany);
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
                    _buildTextField(
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
                        context: context, header: 'Jobs for interns'),
                    SizedBox(height: 10),
                    Container(
                      height: 70.0 * _jobForInterns.length,
                      margin: const EdgeInsets.only(left: 30, right: 50),
                      child: ListView(
                        children: _jobForInterns
                            .map(
                              (job) => DynamicField(
                                function: null,
                                item: job,
                                key: ValueKey(job['id']),
                                deleteField: _deleteField,
                                labelText: job['jobTitle'],
                                list: _jobForInterns,
                                id: job['id'],
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
                          final result = await Navigator.of(context)
                              .pushNamed(AddJobPage.routeName);
                          setState(
                            () {
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
                                key: ValueKey(pastProject['id']),
                                deleteField: _deleteField,
                                labelText: 'Project name and short description',
                                list: _pastProjects,
                                id: pastProject['id'],
                                function: (val) {
                                  _updateValueOfListFields(
                                    val,
                                    _pastProjects.indexOf(pastProject),
                                    _pastProjects,
                                    'pastProj',
                                  );
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
                        'Please enter a valid email',
                        style: TextStyle(color: Colors.red),
                      ),
                    if (_registrationError)
                      Text(
                        ' Registration unsucessful\nPlease refer to above fields ',
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      width: 100,
                      child: FlatButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
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
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          } else {
                            setState(() {
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
