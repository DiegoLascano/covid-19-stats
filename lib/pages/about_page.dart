import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // static const _adUnitID = "ca-app-pub-3940256099942544/6300978111";
  static const _adUnitID = "ca-app-pub-3940256099942544/8135179316";

  final _controller = NativeAdmobController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 200.0,
              color: Colors.green,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 200.0,
              color: Colors.green,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 200.0,
              color: Colors.green,
            ),
            Container(
              height: 200,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.indigoAccent),
              child: NativeAdmob(
                error: Text('Error al cargar el Ad'),
                adUnitID: _adUnitID,
                controller: _controller,
                options: NativeAdmobOptions(
                  ratingColor: Colors.red,
                  headlineTextStyle: NativeTextStyle(color: Colors.red),
                  bodyTextStyle: NativeTextStyle(color: Colors.red),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 200.0,
              color: Colors.green,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 200.0,
              color: Colors.green,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 200.0,
              color: Colors.green,
            ),
            Container(
              height: 330,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20.0),
              child: NativeAdmob(
                error: Text('Error al cargar el Ad'),
                adUnitID: _adUnitID,
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
