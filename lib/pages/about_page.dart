import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

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
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0)),
                child: _getDescription(context),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _getDescription(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Versión 1.0.0',
            style: TextStyle(
              height: 1.4,
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
              color: Colors.grey[800],
            ),
          ),
        ),
        SizedBox(height: 10.0),
        RichText(
          text: TextSpan(
            style: TextStyle(
              height: 1.4,
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              color: Colors.grey[800],
            ),
            children: [
              TextSpan(
                text:
                    'Esta aplicación fue diseñada con el objetivo de mostrar las estadísticas locales y a nivel mundial sobre el avance de la pandemia del virus COVID-19, de forma ',
              ),
              TextSpan(
                text: 'fácil y libre',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              TextSpan(
                text: ' para todos los usuarios.',
              ),
            ],
          ),
        ),
        SizedBox(height: 15.0),
        RichText(
          text: TextSpan(
            style: TextStyle(
              height: 1.4,
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              color: Colors.grey[800],
            ),
            children: [
              TextSpan(
                text: 'COVID-19 Estadísticas',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
              TextSpan(
                text:
                    ' es una aplicación que funciona en tiempo real, es decir, cada que ingresas a revisar las estadísticas locales o globales, la aplicación adquiere la información más actualizada de la nube.',
              ),
            ],
          ),
        ),
        SizedBox(height: 15.0),
        RichText(
          text: TextSpan(
            style: TextStyle(
              height: 1.4,
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              color: Colors.grey[800],
            ),
            children: [
              TextSpan(
                text: 'Esta información es meramente ',
              ),
              TextSpan(
                text: 'informativa ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              TextSpan(
                text: 'y para ',
              ),
              TextSpan(
                text: 'uso personal',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              TextSpan(
                text:
                    '. Sin bien es cierto, los datos que entrega la aplicación provienen de fuentes confiables, esta no debe ser usada con un propósito diferente al antes mencionado.',
              ),
            ],
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          'Los datos utilizados en esta aplicación son obtenidos de las siguientes fuentes de información digitales:',
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
                    color: Colors.indigoAccent,
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
                  text: 'https://www.worldometers.info/coronavirus',
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.indigoAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          'Nota: Todos los datos son generados de forma automática, por lo que se puede apreciar los nombres de los paises en inglés.',
          style: TextStyle(
            height: 1.4,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}

// https://github.com/javieraviles/covidAPI
