import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/flat_button.dart';

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
  var _errorMessage = ['Please fill the previous field first'];
  var _genders = ['Male', 'Female'];

  var _months = [
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

  List<String> _schools = [
    'NUS',
    'NTU',
    'SIM',
    'SMU',
    'SP',
    'TP',
    'RP',
  ];

  Map<String, List<String>> _faculties = {
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

  Widget _buildTextField(
      String labelText, double paddingRight, bool obscure, bool enableText) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: paddingRight),
      child: TextFormField(
        readOnly: enableText,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PerFit',
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontSize: 20,
                color: Theme.of(context).accentColor,
              ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            _buildTextField('Email', 100, false, false),
            SizedBox(height: 25),
            _buildTextField('Password', 150, true, false),
            SizedBox(height: 25),
            _buildTextField('Name', 100, false, false),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(
                left: 30,
                right: 200,
              ),
              padding: EdgeInsets.only(left: 14),
              height: 50,
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
                        print(this._endDateSelected.toString());
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 30, right: 180),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: DropdownButtonFormField(
                decoration: InputDecoration.collapsed(hintText: ''),
                hint: Text(
                  'University/Polytechnic',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onChanged: (val) => setState(() {
                  this._schoolSelected = val;
                  this._facultySelected = null;
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 30, right: 180),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: DropdownButtonFormField(
                value: _facultySelected,
                isExpanded: true,
                decoration: InputDecoration.collapsed(hintText: ''),
                hint: Text(
                  'Faculty',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onChanged: (val) => setState(() {
                  _facultySelected = val;
                }),
                items: _schoolSelected != null
                    ? _faculties[_schoolSelected]
                        .map(
                          (school) => DropdownMenuItem(
                            child: Text(school),
                            value: school,
                          ),
                        )
                        .toList()
                    : _errorMessage
                        .map(
                          (error) => DropdownMenuItem(
                            child: Text(error),
                            value: error,
                          ),
                        )
                        .toList(),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
