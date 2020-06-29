//import 'dart:html';

import 'package:flutter/material.dart';

import './jobs_for_interns_list.dart';

class Company {
  final String id;
  final String name;
  final String logoURL;
  final String founderName;
  final String industry;
  final String joinedDate;
  final JobsForInternsList jobList;
  final String location;
  final Map<String, String> tempJob;

  const Company(
      {@required this.id,
      @required this.name,
      @required this.logoURL,
      @required this.founderName,
      @required this.industry,
      @required this.joinedDate,
      @required this.jobList,
      this.tempJob,
      this.location});
}
