import 'package:flutter/material.dart';

import 'package:covid_19_stats/models/country_model.dart';

class CountryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Country countryStats = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 en ${countryStats.country}'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                countryStats.country,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[800],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            _createStatsInfo('Casos', countryStats.cases,
                                countryStats.todayCases),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Divider(thickness: 2.0),
                            ),
                            _createStatsInfo('Muertes', countryStats.deaths,
                                countryStats.todayDeaths),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Divider(thickness: 2.0),
                            ),
                            _createStatsInfo(
                                'Recuperados', countryStats.recovered),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Divider(thickness: 2.0),
                            ),
                            _createStatsInfo('Activos', countryStats.active),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Divider(thickness: 2.0),
                            ),
                            _createStatsInfo('Críticos', countryStats.critical),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Divider(thickness: 2.0),
                            ),
                            _createStatsInfo('Casos por millón',
                                countryStats.casesPerOneMillion),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createStatsInfo(String label, int total, [int today]) {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
                color: Colors.grey[800],
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    total.toString(),
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                  Text(
                    ' total',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              _checkConditional(today),
            ],
          ),
        ],
      ),
    );
  }

  Widget _checkConditional(int today) {
    if (today != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Text(
            today.toString(),
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          Text(
            ' hoy',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
