import 'package:Studily/pages/notes/notes_page.dart';
import 'package:Studily/pages/welcome/welcome.dart';
import 'package:Studily/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'pages/login/register.dart';

// void main() => runApp(MyApp());
void main() {
  locator.registerLazySingleton(() => NavigationService());
  runApp(MyApp());
}

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/notes': (BuildContext context) => new NotesPage(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new WelcomeScreen(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Studily',
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case 'notes':
            return MaterialPageRoute(builder: (context) => NotesPage());
          default:
            return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
      routes: routes,
    );
  }
}
