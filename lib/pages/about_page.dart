import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'COVID-19 Estadísticas',
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
                'Acerca de la aplicación',
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: _getDescription(context),
            ),
          )
        ]),
      ),
    );
  }

  Widget _getDescription(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Esta aplicación fue diseñada con el objetivo de mostrar las estadísticas locales y a nivel mundial sobre el avance de la pandemia del virus COVID-19.',
          style: TextStyle(
            height: 1.4,
            fontSize: 18.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          'COVID-19 Estadísticas es una aplicación que funciona en tiempo real, es decir, cada que ingresas a revisar las estadísticas locales o globales, la aplicación adquiere la información de una base de datos pública actualizada. Por esta razón, COVID-19 Estadísticas requiere que estes conectado a una red de datos o WiFi.',
          style: TextStyle(
            height: 1.4,
            fontSize: 18.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          'Los datos utilizados en esta apicación son obtenidos de las siguientes fuentes de información digitales:',
          style: TextStyle(
            height: 1.4,
            fontSize: 18.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 15.0),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'https://github.com/javieraviles/covidAPI',
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'https://www.worldometers.info/coronavirus.',
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// https://github.com/javieraviles/covidAPI
