import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference studentDataCollection =
      Firestore.instance.collection('students');

  final CollectionReference employerDataCollection =
      Firestore.instance.collection('employers');

  Future updateStudentData({
    String name,
    String dateOfBirth,
    String gender,
    String start,
    String end,
    String school,
    String faculty,
    String course,
    String specialisation,
    int yearOfStudy,
    List skillsets,
    List pastProj,
    List workExp,
    String shortDesc,
  }) async {
    return await studentDataCollection.document(uid).setData({
      'name': name,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'start_month': start,
      'end_month': end,
      'school': school,
      'faculty': faculty,
      'course': course,
      'specialisation': specialisation,
      'year_of_study': yearOfStudy,
      'skillsets': skillsets,
      'past_projects': pastProj,
      'work_experiences': workExp,
      'short_description': shortDesc,
    });
  }

  Future updateEmployerData({
    String name,
    String companyName,
    String companyAdd,
    String companyRegNum,
    String industry,
    int officeNum,
    int personalNum,
    bool personalNumOnProf,
    String aboutCompany,
    String internsGain,
    List jobs,
    List pastProj,
  }) async {
    return await employerDataCollection.document(uid).setData(
      {
        'name': name,
        'company_name': companyName,
        'company_address': companyAdd,
        'company_registration_number': companyRegNum,
        'office_number': officeNum,
        'personal_number': personalNum,
        'showing_personal_number_on_profile': personalNumOnProf,
        'about_company': aboutCompany,
        'benefits_for_interns': internsGain,
        'jobs_for_interns': jobs,
        'past_projects': pastProj,
      },
    );
  }
}
