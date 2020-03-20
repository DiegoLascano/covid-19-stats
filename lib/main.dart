import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:covid_19_stats/routes/routes.dart';

const String testDevice = 'EMULATOR';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Test ID
  // static const _adUnitID = "ca-app-pub-3940256099942544/8135179316";
  // Interstitial ad ID
  static const _adUnitID = "ca-app-pub-1500612778036594/4589436680";

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    // testDevices: testDevice != null
    //     ? <String>[testDevice]
    //     : null,
    keywords: <String>['covid 19', 'pandemia', 'coronavirus'],
    // contentUrl: 'https://flutter.io',
    childDirected: false,
    nonPersonalizedAds: false,
  );

  InterstitialAd _interstitialAd;

  void _startTimer() {
    _interstitialAd..load();
    final Duration duration = new Duration(seconds: 45);
    new Timer(duration, () {
      _interstitialAd?.show();
    });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: _adUnitID,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        // print("InterstitialAd event $event");
        // if (event == MobileAdEvent.closed) {
        //   print("InterstitialAd event $event");
        // }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _interstitialAd?.dispose();
    _interstitialAd = createInterstitialAd();
    _startTimer();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      title: 'Covid-19 InfoApp',
      initialRoute: 'bottom_navigation',
      routes: getApplicationRoutes(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(242, 242, 247, 1.0),
      ),
    );
  }
}
