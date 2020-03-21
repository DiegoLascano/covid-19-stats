import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:covid_19_stats/models/country_model.dart';

class CountryCard extends StatelessWidget {
  final Country countryStat;

  CountryCard({@required this.countryStat});

  final NumberFormat _formatter = new NumberFormat("###,###");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            margin: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      countryStat.country,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey[600],
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          _formatNumber(countryStat.cases),
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                          ),
                        ),
                        Text(
                          ' casos',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          _formatNumber(countryStat.deaths),
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                          ),
                        ),
                        Text(
                          ' muertes',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, 'country_detail', arguments: countryStat);
      },
    );
  }

  String _formatNumber(int number) {
    String _formattedNumber = _formatter.format(number);
    return _formattedNumber.replaceAll(RegExp(','), '.');
  }
}
