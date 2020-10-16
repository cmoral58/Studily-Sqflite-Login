import 'package:Studily/pages/home/home_body.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Container(
            child: HomePageBody(),
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
