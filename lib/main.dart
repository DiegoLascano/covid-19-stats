import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:covid_19_stats/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
