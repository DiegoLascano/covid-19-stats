import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';

import 'package:covid_19_stats/providers/stats_provider.dart';
import 'package:covid_19_stats/widgets/country_card_widget.dart';
import 'package:covid_19_stats/search/search_delegate.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final statsProvider = new StatsProvider();
  final _controller = NativeAdmobController();

  double _height = 0;
  StreamSubscription _subscription;
  // Test ID
  // static const _adUnitID = "ca-app-pub-3940256099942544/8135179316";
  // Native Advanced ID
  static const _adUnitID = "ca-app-pub-1500612778036594/7061549173";

  @override
  void initState() {
    _subscription = _controller.stateChanged.listen(_onStateChanged);
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height = 0.0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height = 100.0;
        });
        break;

      case AdLoadState.loadError:
        setState(() {
          _height = 0.0;
        });
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    color: Colors.grey[800],
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
        if ((index + 1) % 4 == 0) {
          return Column(
            children: <Widget>[
              _createNativeAd(),
              CountryCard(countryStat: perCountryStats[index]),
            ],
          );
        } else {
          return CountryCard(countryStat: perCountryStats[index]);
        }
      },
    );
  }

  Widget _createNativeAd() {
    return Container(
      height: _height,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: (_height / 20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: NativeAdmob(
        error: Text('Error al cargar el anuncio'),
        adUnitID: _adUnitID,
        controller: _controller,
        options: NativeAdmobOptions(
          showMediaContent: false,
          ratingColor: Colors.amberAccent,
        ),
      ),
    );
  }
}
