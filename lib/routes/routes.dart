import 'package:flutter/material.dart';

import 'package:covid_19_stats/pages/about_page.dart';
import 'package:covid_19_stats/pages/bottom_bar_controller.dart';
import 'package:covid_19_stats/pages/calculator_page.dart';
import 'package:covid_19_stats/pages/country_detail.dart';
import 'package:covid_19_stats/pages/country_page.dart';
import 'package:covid_19_stats/pages/global_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'country': (BuildContext context) => CountryPage(),
    'country_detail': (BuildContext context) => CountryDetail(),
    'global': (BuildContext context) => GlobalPage(),
    'calculator': (BuildContext context) => CalculatorPage(),
    'bottom_navigation': (BuildContext context) => BottomBarController(),
    'about': (BuildContext context) => AboutPage(),
  };
}
