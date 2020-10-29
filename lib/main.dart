import 'package:Studily/pages/notes/notes_page.dart';
import 'package:Studily/pages/welcome/welcome.dart';
import 'package:Studily/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'pages/login/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';
import 'package:Studily/pages/formal/search_book_page_formal.dart';
import 'package:Studily/pages/formal/stamp_collection_page_formal.dart';
import 'package:Studily/pages/material/search_book_page_material.dart';
import 'package:Studily/pages/material/stamp_collection_page_material.dart';
import 'package:Studily/pages/universal/collection_page.dart';

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
  '/search_material': (BuildContext context) => new SearchBookPage(),
  '/search_formal': (BuildContext context) => new SearchBookPageNew(),
  '/collection': (BuildContext context) => new CollectionPage(),
  '/stamp_collection_material': (BuildContext context) =>
      new StampCollectionPage(),
  '/stamp_collection_formal': (BuildContext context) =>
      new StampCollectionFormalPage(),
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

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new WelcomeScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
