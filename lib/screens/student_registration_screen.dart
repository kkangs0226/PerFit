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
  DateTime _selectedDate;
  var months = [
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
        _selectedDate = pickedDate;
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
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
                      _selectedDate == null
                          ? 'Date of birth'
                          : DateFormat('dd/MM/yyyy').format(_selectedDate),
                      style: TextStyle(
                        color: _selectedDate == null
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
            _buildTextField('Gender', 30, false, false),
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
                      hint: Text('Start', style: TextStyle()),
                      onChanged: (val) => setState(() {}),
                      items: months
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
                      hint: Text('End', style: TextStyle()),
                      onChanged: (val) => setState(() {}),
                      items: months
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
          ],
        ),
      ),
    );
  }
}
