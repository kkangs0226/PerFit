import 'package:flutter/material.dart';

class FavouritesCompaniesScreen extends StatelessWidget {
  static const routeName = '/favourites_companies_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourited Companies'),
      ),
      body: Center(
        child: Text('Your Favourites'),
      ),
    );
  }
}