import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:covid_19_stats/models/global_model.dart';
import 'package:covid_19_stats/models/country_model.dart';

class StatsProvider {
  String globalUrl = 'https://coronavirus-19-api.herokuapp.com/all';
  String byCountryUrl = 'https://coronavirus-19-api.herokuapp.com/countries';

  Future getGlobalStats() async {
    final response = await http.get(globalUrl);
    final decodedData = json.decode(response.body);
    final globalStats = new Global.fromJsonMap(decodedData);

    return globalStats;
  }

  Future<List<Country>> getPerCountryStats() async {
    final response = await http.get(byCountryUrl);
    final decodedData = json.decode(response.body);
    final countriesStats = new Countries.fromJsonList(decodedData);

    return countriesStats.items;
  }

  Future<List<Country>> searchCountry(String query) async {
    final response = await http.get(byCountryUrl);
    final decodedData = json.decode(response.body);

    List<Map> countries = new List();
    String queryStandard =
        '${query[0].toUpperCase()}${query.substring(1).toLowerCase()}';

    for (var countryStats in decodedData) {
      if (countryStats['country'].contains(queryStandard)) {
        countries.add(countryStats);
      }
    }

    final countriesStats = new Countries.fromJsonList(countries);

    return countriesStats.items;
  }
}
