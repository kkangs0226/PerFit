import 'package:flutter/material.dart';
import 'package:perfit_app/widgets/home_bar/search/search_list_icons.dart';
import 'package:provider/provider.dart';

import '../../../dummy_data.dart';
import '../../../providers/companies_list.dart';

//import '../../providers/companies_list.dart';

class DataSearch extends SearchDelegate<String> {
  final companies = DummyData.DUMMY_COMPANIES;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = Provider.of<CompaniesList>(context).getCompanies;
    final filteredSuggestionList = suggestionList
        .where(
          (element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()) ||
              element.industry.toLowerCase().startsWith(query.toLowerCase()) ||
              element.tempJob['title']
                  .toLowerCase()
                  .startsWith(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemCount: filteredSuggestionList.length,
      itemBuilder: (ctx, i) => ListTile(
        leading: ChangeNotifierProvider.value(
            value: filteredSuggestionList[i], child: SearchListIconCompany()),
        title: Text(
          filteredSuggestionList[i].name,
        ),
      ),
    );
  }
}
