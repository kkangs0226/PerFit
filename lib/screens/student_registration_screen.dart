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
            Stack(
              children: [
                _buildTextField(
                    _selectedDate == null
                        ? 'Date of birth'
                        : DateFormat('dd/MM/yyyy').format(_selectedDate),
                    230,
                    false,
                    true),
                Positioned(
                  top: 5,
                  left: 120,
                  child: CustomFlatButtonIcon(
                    '',
                    _presentDatePicker,
                    Icon(Icons.calendar_today),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            _buildTextField('Gender', 30, false, false),
            SizedBox(height: 25),
            _buildTextField('Availability', 30, false, false),
          ],
        ),
      ),
    );
  }
}
