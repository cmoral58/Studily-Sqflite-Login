import 'dart:convert';

import 'package:Studily/data/rest-data.dart';
import 'package:Studily/models/user.dart';
import 'package:Studily/pages/notes/notes_page.dart';
import 'package:Studily/pages/welcome/welcome.dart';
import 'package:Studily/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'data/database-helper.dart';
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
  // '/': (BuildContext context) => new WelcomeScreen(),
  // '/': (Builder context) => new LoggedIn(),
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
      home: HomePage(),
      // navigatorKey: locator<NavigationService>().navigatorKey,
      // onGenerateRoute: (routeSettings) {
      //   switch (routeSettings.name) {
      //     case 'notes':
      //       return MaterialPageRoute(builder: (context) => NotesPage());
      //     default:
      //       return MaterialPageRoute(builder: (context) => HomePage());
      //   }
      // },
      routes: routes,
    );
  }
}

class LoggedIn extends StatefulWidget {
  LoggedIn({Key key}) : super(key: key);

  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  Future<bool> doLogin() async {
    DatabaseHelper dbHelper = new DatabaseHelper();
    String username = dbHelper.columnUserName;
    String password = dbHelper.columnPassword;
    try {
      if (RestData().login(username, password) != null) {
        // final user = User.map(obj[username]);
        final user = User.map(username);
        DatabaseHelper dbHelper = new DatabaseHelper();
        await dbHelper.saveUser(user);
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<String> getLoggedInUser() async {
    DatabaseHelper dbHelper = new DatabaseHelper();
    User username = dbHelper.columnUserName as User;
    bool isLoggedIn = await doLogin();
    if (isLoggedIn) {
      User user = (await DatabaseHelper().saveUser(username)) as User;
      return user.name;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLoggedInUser(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print(snapshot.error);
          return Center(child: Text("Something..."));
        } else if (snapshot.hasError) {
          // just to show you how to fetch from db
          if (snapshot.data != null) {
            return Center(child: Text("Logged in token: ${snapshot.data}"));
          }
          return Center(child: Text("Not logged in"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
