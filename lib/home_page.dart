// ignore_for_file: prefer_const_constructors

import 'package:calculator_app/calc_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                ThemeProvider themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.swapTheme();
              },
              icon: Icon(Icons.brightness_6_outlined))
        ],
      ),
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
                leading: Icon(Icons.currency_exchange_outlined),
                title: Text('Calculator'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/calcPage');
                }),
            ListTile(
                leading: Icon(Icons.currency_exchange_outlined),
                title: Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/aboutPage');
                }),
          ],
        ),
      ),
      body: Center(
          child: Icon(
        Icons.home_outlined,
        size: 50,
      )),
    );
  }
}
