import 'package:flutter/material.dart';

class JobForInterns {
  final String jobTitle;
  final String jobSpecialisation;
  final String startMonth;
  final String endMonth;
  final String jobDescription;
  final String jobRequirements;
  final bool fullTime;
  final bool partTime;
  final double salary;

  JobForInterns({
    @required this.jobTitle,
    @required this.jobSpecialisation,
    @required this.jobDescription,
    @required this.fullTime,
    @required this.partTime,
    @required this.salary,
    this.startMonth,
    this.endMonth,
    this.jobRequirements,
  });
}
