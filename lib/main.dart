import 'package:Studily/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'pages/login/register.dart';

void main() => runApp(MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new WelcomeScreen(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Studily',
      routes: routes,
    );
  }
}
