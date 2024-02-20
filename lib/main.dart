// ignore_for_file: prefer_const_constructors

import 'package:calculator_app/about.dart';
import 'package:calculator_app/calc_theme.dart';
import 'package:calculator_app/dependency_injection.dart';
import 'package:calculator_app/home_page.dart';
import 'package:calculator_app/login_page.dart';
import 'package:calculator_app/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'calculator_view.dart';
//import 'package:calculator_app/calculator_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      child: MyApp(),
      create: (BuildContext context) => ThemeProvider(
            isDarkMode: prefs.getBool("isDarkTheme") ?? false,
          )));
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return GetMaterialApp(
          title: 'Flutter Calc',
          theme: themeProvider.getTheme,
          debugShowCheckedModeBanner: false,
          home: Navigation(),
          routes: {
            '/homePage': (context) => HomePage(),
            '/calcPage': (context) => CalculatorView(),
            '/aboutPage': (context) => About(),
            '/loginPage': (context) => LoginPage(),
          },
        );
      },
    );
  }
}
