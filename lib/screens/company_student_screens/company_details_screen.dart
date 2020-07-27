import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:perfit_app/dummy_data.dart';

import '../../providers/companies_list.dart';
import '../../models/company.dart';

class CompanyDetailsScreen extends StatelessWidget {
  static const routeName = './company_details_screen';

  /*final Function toggleFavourites;
  final Function isFavourite;

  CompanyDetailsScreen(this.toggleFavourites, this.isFavourite);
  */

  @override
  Widget build(BuildContext context) {
    final companyId = ModalRoute.of(context).settings.arguments as String;
    final companies = Provider.of<CompaniesList>(context);
    final selectedCompany = companies.findById(companyId);
    //final selectedStudent = DummyData.DUMMY_STUDENTS[1];
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Company Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      selectedCompany.logoURL,
                      height: 120,
                      width: 90,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: mediaQueryData.size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 3, right: 10, left: 10),
                        child: Text(
                          'Name: ${selectedCompany.name}',
                          //'Name: djklajfdklfjlasdjfklasjf',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Industry: ${selectedCompany.industry}',
                              //'Name: djklajfdklfjlasdjfklasjf',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Container(
                              //width: mediaQueryData.size.width * 0.4,
                              child: Text(
                                'Founder Name: ${selectedCompany.founderName}',
                                //'Name: djklajfdklfjlasdjfklasjf',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Text(
                              'Location: ${selectedCompany.location}',
                              //'Name: djklajfdklfjlasdjfklasjf',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              'Date Joined: ${selectedCompany.joinedDate}',
                              //'Name: djklajfdklfjlasdjfklasjf',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: mediaQueryData.size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Jobs Available',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Title: ${selectedCompany.tempJob['title']}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                            width: 2,
                          ),
                          Text(
                            'Duration: ${selectedCompany.tempJob['duration']}',
                          ),
                          Text(
                            'Skillset: ${selectedCompany.tempJob['skillsets']}',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              selectedCompany.isFavourite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Color.fromRGBO(250, 20, 131, 1.0),
            ),
            onPressed: () {
              selectedCompany.toggleFavourites();
              companies.updateList();
              if (selectedCompany.isFavourite) {
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You favourited ${selectedCompany.name}!'),
                    duration: Duration(
                      seconds: 2,
                    ),
                  ),
                );
              } else {
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You unfavourited ${selectedCompany.name}!'),
                    duration: Duration(
                      seconds: 2,
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
