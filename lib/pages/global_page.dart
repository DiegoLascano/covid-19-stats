import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';

import 'package:covid_19_stats/providers/stats_provider.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  final statsProvider = new StatsProvider();
  final _controller = NativeAdmobController();

  final NumberFormat _formatter = new NumberFormat("###,###");

  double _height = 0;
  StreamSubscription _subscription;
  // Test ID
  // static const _adUnitID = "ca-app-pub-3940256099942544/8135179316";
  // Native 2 Id
  static const _adUnitID = "ca-app-pub-1500612778036594/5687730085";

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
          _height = 330.0;
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
                  'Estadísticas a nivel mundial',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: _getGlobalStats(),
            )
          ],
        ),
      ),
    );
  }

  Widget _getGlobalStats() {
    return FutureBuilder(
      future: statsProvider.getGlobalStats(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final globalStats = snapshot.data;
          return ListView(
            children: <Widget>[
              _createStatsInfo('Casos', globalStats.cases),
              _createNativeAd(),
              _createStatsInfo('Muertes', globalStats.deaths),
              _createStatsInfo('Recuperados', globalStats.recovered),
            ],
          );
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

  Widget _createStatsInfo(String label, int total) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Colors.grey[800],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                _formatNumber(total),
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
        ],
      ),
    );
  }

  Widget _createNativeAd() {
    return Container(
      height: _height,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: (_height / 66)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: NativeAdmob(
        error: Text('Error al cargar el anuncio'),
        adUnitID: _adUnitID,
        controller: _controller,
        options: NativeAdmobOptions(
          showMediaContent: true,
          ratingColor: Colors.amberAccent,
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    String _formattedNumber = _formatter.format(number);
    return _formattedNumber.replaceAll(RegExp(','), '.');
  }
}
