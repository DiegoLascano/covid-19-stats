import 'package:flutter/material.dart';

import 'package:covid_19_stats/providers/stats_provider.dart';
import 'package:covid_19_stats/widgets/country_card_widget.dart';
import 'package:covid_19_stats/search/search_delegate.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final statsProvider = new StatsProvider();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              // textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'COVID-19',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Estadísticas por país',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CountrySearch(),
                    );
                  },
                )
              ],
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  _getPerCountryStats(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPerCountryStats() {
    return FutureBuilder(
      future: statsProvider.getPerCountryStats(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final perCountryStats = snapshot.data;
          return _createPerCountryList(perCountryStats);
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _createPerCountryList(perCountryStats) {
    return ListView.builder(
      itemCount: perCountryStats.length,
      itemBuilder: (BuildContext context, int index) {
        return CountryCard(countryStat: perCountryStats[index]);
      },
    );
  }
}
