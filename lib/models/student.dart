import 'package:flutter/material.dart';

class Student {
  final String name;
  final String school;
  final String course;
  final String skillsets;
  final int year;
  final String profileURL;
  final int age;
  final String personalStatement;
  final String resumeURL;

  Student(
      {this.course,
      this.name,
      this.profileURL,
      this.school,
      this.skillsets,
      this.year,
      this.age,
      this.personalStatement,
      this.resumeURL});
}
