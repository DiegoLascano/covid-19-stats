class Global {
  int cases;
  int deaths;
  int recovered;

  Global({
    this.cases,
    this.deaths,
    this.recovered,
  });

  Global.fromJsonMap(json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
  }
}
