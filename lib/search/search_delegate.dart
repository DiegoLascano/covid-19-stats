import 'package:flutter/material.dart';

import 'package:covid_19_stats/widgets/country_card_widget.dart';
import 'package:covid_19_stats/models/country_model.dart';
import 'package:covid_19_stats/providers/stats_provider.dart';

class CountrySearch extends SearchDelegate {
  String selected = '';
  final statsProvider = new StatsProvider();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: statsProvider.searchCountry(query),
      builder: (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
        if (snapshot.hasData) {
          final countries = snapshot.data;
          return ListView(
            children: countries.map((country) {
              return ListTile(
                title: Text(country.country),
                subtitle: Text(country.cases.toString()),
                onTap: () {
                  // country.uniqueId = '';
                  // close(context, null);
                  // Navigator.pushNamed(context, 'details', arguments: country);
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: statsProvider.searchCountry(query),
      builder: (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
        if (snapshot.hasData) {
          final countries = snapshot.data;
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: CountryCard(countryStat: countries[index]),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'country_detail',
                    arguments: countries[index],
                  );
                },
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
