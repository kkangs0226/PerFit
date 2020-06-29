import 'package:flutter/material.dart';
import 'package:perfit_app/widgets/textfield_header.dart';

import '../../../../models/jobs_for_interns.dart';
import '../../../../widgets/dropdown_border.dart';
import '../../../../widgets/dynamic_field.dart';

class AddJobPage extends StatefulWidget {
  static const routeName = '/addJobPage';

  @override
  _AddJobPageState createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  String _jobTitle;
  String _jobDesciption;
  String _jobSpecialisationSelected;
  String _durationSelected;
  double _salary;
  String _end;
  String _start;
  bool _fullTime = false;
  bool _partTime = false;
  List<Map<String, String>> _skillsets = [];

  List<String> _jobSpecialisations = [
    'Computer Science',
    'Information Systems',
    'Design',
    'Engineering',
    'Healthcare',
  ];

  List<String> _durations = [
    '3 months',
    '6 months',
    '9 months',
    '12 months',
  ];

  void _updateValueOfListFields(String val, int index, List list, String key) {
    list[index][key] = val;
    print(val);
  }

  void _deleteField(List list, String id) {
    setState(() {
      list.removeWhere((item) => item['id'] == id);
      for (int i = 0; i < list.length; i++) {
        print(list[i]['id']);
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            _buildTextField(
              function: (val) {
                _jobTitle = val;
                print(_jobTitle);
              },
              labelText: 'Job title',
              marginRight: 100.0,
              obscure: false,
              enableText: true,
            ),
            SizedBox(height: 25),
            DropdownBorder(
              context: context,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _jobSpecialisationSelected,
                  isExpanded: true,
                  hint: Text(
                    'Job Specialisation',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  items: _jobSpecialisations
                      .map(
                        (job) => DropdownMenuItem(
                          child: Text(job),
                          value: job,
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _jobSpecialisationSelected = val;
                      print(_jobSpecialisationSelected);
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 25),
            DropdownBorder(
              context: context,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text(
                    'Duration',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  value: _durationSelected,
                  items: _durations
                      .map(
                        (duration) => DropdownMenuItem(
                          child: Text(duration),
                          value: duration,
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _durationSelected = val;
                      print(_durationSelected);
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 25),
            TextFieldHeader(
              error: false,
              context: context,
              header: 'Job description',
            ),
            _buildTextField(
              function: (val) {
                _jobDesciption = val;
                print(_jobDesciption);
              },
              marginRight: 100.0,
              obscure: false,
              enableText: true,
              maxLines: 3,
            ),
            SizedBox(height: 25),
            TextFieldHeader(
              error:false,
              context: context,
              header: 'Job skillset requirements',
            ),
            SizedBox(height: 10),
            Container(
              height: 70.0 * _skillsets.length,
              margin: EdgeInsets.only(left: 30, right: 50),
              child: ListView(
                children: _skillsets
                    .map(
                      (skillset) => DynamicField(
                        function: (val) {
                          _updateValueOfListFields(
                            val,
                            _skillsets.indexOf(skillset),
                            _skillsets,
                            'skillset',
                          );
                        },
                        item: skillset,
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
                    _skillsets
                        .add({'skillset': '', 'id': DateTime.now().toString()});
                    print(DateTime.now().toString());
                    print(_skillsets.length);
                  });
                },
              ),
            ),
            SizedBox(height: 25),
            TextFieldHeader(
              error: false,
              context: context,
              header: 'Working schedule',
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: _fullTime,
                        onChanged: (val) {
                          setState(() {
                            _fullTime = !_fullTime;
                            print(_fullTime);
                          });
                        },
                      ),
                      Text(
                        'Full time',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: _partTime,
                        onChanged: (val) {
                          setState(() {
                            _partTime = !_partTime;
                            print(_partTime);
                          });
                        },
                      ),
                      Text(
                        'Part time',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            _buildTextField(
              function: (val) {
                _salary = double.parse(val);
                _salary = num.parse(_salary.toStringAsFixed(2));
                print(_salary);
              },
              labelText: 'Salary',
              marginRight: 250.0,
              obscure: false,
              enableText: true,
              textInputType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 100,
              child: FlatButton(
                onPressed: () {
                  String id = DateTime.now().toString();
                  print(_salary);
                  print(id);
                  Navigator.pop(
                    context,
                    JobForInterns(
                      jobRequirements: _skillsets,
                      endMonth: _end,
                      startMonth: _start,
                      id: id,
                      jobTitle: _jobTitle,
                      duration: _durationSelected,
                      jobSpecialisation: _jobSpecialisationSelected,
                      jobDescription: _jobDesciption,
                      fullTime: _fullTime,
                      partTime: _partTime,
                      salary: _salary,
                    ),
                  );
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
