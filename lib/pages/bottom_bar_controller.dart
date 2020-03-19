import 'package:flutter/material.dart';

import 'package:covid_19_stats/pages/country_page.dart';
import 'package:covid_19_stats/pages/global_page.dart';
import 'package:covid_19_stats/pages/about_page.dart';

class BottomBarController extends StatefulWidget {
  @override
  _BottomBarControllerState createState() => _BottomBarControllerState();
}

class _BottomBarControllerState extends State<BottomBarController> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    GlobalPage(),
    CountryPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          // canvasColor: Color.fromRGBO(255, 255, 255, 0.6),
          // primaryColor: Color.fromRGBO(4, 78, 84, 1.0),
          // textTheme: Theme.of(context).textTheme.copyWith(
          //       caption: TextStyle(
          //         color: Colors.blueGrey[800],
          //       ),
          //     ),
          ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Container(),
            icon: Icon(Icons.poll, size: 30.0),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: Icon(Icons.flag, size: 30.0),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: Icon(Icons.info_outline, size: 30.0),
          ),
          // BottomNavigationBarItem(
          //   title: Container(),
          //   icon: Icon(Icons.flag, size: 30.0),
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // selectedItemColor: Colors.amber[800],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
