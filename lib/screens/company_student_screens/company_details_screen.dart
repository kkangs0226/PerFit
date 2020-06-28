import 'package:flutter/material.dart';

class CompanyDetailsScreen extends StatelessWidget {
  static const routeName = './company_details_screen';

  //final String companyId;

  //CompanyDetailsScreen(this.companyId);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('companyName'),), body: Center(child: Text('copmany'),),);
    
  }
}