import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../models/company.dart';
import '../models/student.dart';
import '../dummy_data.dart';
//import '../providers/companies_list.dart';
//import '../providers/students_list.dart';

class OfferItem {
  /*final String id;
  final String name;
  final String imageURL;
  final String industry;
  final String school;
  
  final String course;
  final String founderName;
  final String joinedDate;
  */
  final bool isStudent;
  final String companyId;
  final String studentId;

  OfferItem({
    this.isStudent,
    this.companyId,
    this.studentId,
  });
}

class Offers with ChangeNotifier {
  List<OfferItem> _offerListStudents = [];
  List<OfferItem> _offerListCompanies = [];

  List<OfferItem> get offerListCompanies {
    return [..._offerListCompanies];
  }

  List<OfferItem> get offerListStudents {
    return [..._offerListStudents];
  }

  void addOfferStudent(String studentId, String name) {
    _offerListStudents.add(OfferItem(
      isStudent: true,
      studentId: studentId,
      companyId: 'nil',
    ));
    notifyListeners();
  }

  void cancelOfferStudent(String name) {
    _offerListStudents.remove(name);
    notifyListeners();
  }
}
