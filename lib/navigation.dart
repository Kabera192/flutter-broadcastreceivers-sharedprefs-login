// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:calculator_app/calculator_view.dart';
import 'package:calculator_app/login_page.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'home_page.dart';

class Navigation extends StatefulWidget {
  Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int navIndex = 0;

  void _navTapped(index) {
    setState(() {
      navIndex = index;
    });
  }

  static List<Widget> myTabs = <Widget>[
    HomePage(),
    CalculatorView(),
    About(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                child: Column(),
              ),
              ListTile(
                leading: Icon(Icons.home_max_outlined),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/homePage');
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Login'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/loginPage');
                },
              ),
              ListTile(
                  leading: Icon(Icons.currency_exchange_outlined),
                  title: Text('Calculator'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/calcPage');
                  }),
              ListTile(
                  leading: Icon(Icons.people),
                  title: Text('About'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/aboutPage');
                  }),
            ],
          ),
        ),
        body: Center(
          child: myTabs[navIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: navIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline_outlined),
              label: 'About Us',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.lock), label: 'Login')
          ],
          //currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: (value) => _navTapped(value),
        ),
      ),
    );
  }
}
