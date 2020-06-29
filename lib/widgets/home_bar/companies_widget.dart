import 'package:flutter/material.dart';

import 'package:perfit_app/dummy_data.dart';

import '../../screens/company_student_screens/company_details_screen.dart';
import '../../models/company.dart';

class CompanyWidget extends StatelessWidget {
  final int index;

  CompanyWidget(this.index);

  List<Company> listCompanies = DummyData.DUMMY_COMPANIES;

  @override
  Widget build(BuildContext context) {
    String companyId = listCompanies[index].id;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        CompanyDetailsScreen.routeName, arguments: companyId,
        //arguments: companyId,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(3),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //color: Theme.of(context).primaryColorDark,
              color: Colors.black54,
            ),
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(
                listCompanies[index].logoURL,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            height: 30,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Text(
              listCompanies[index].name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
