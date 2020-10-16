import 'package:flutter/material.dart';
import 'package:Studily/pages/welcome/welcome.dart';

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

class HomePageBody extends StatelessWidget {
  // final Widget child;
  // const HomePageBody({
  //   Key key,
  //   @required this.child,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          extendBodyBehindAppBar: true,
          body: Container(
            child: HomePageBackground(child: null),
            color: Colors.transparent,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Builder(
                builder: (context) => Ink(
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white.withOpacity(0.8),
                      size: 30,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            titleSpacing: 0,
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                // SizedBox(
                //   height: 30,
                // ),
                DrawerHeader(
                  child: Container(
                    height: 142,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/Studily_avatar.png",
                      height: 50, // These things also do nothing
                      width: 50, // These things also do nothing
                    ),
                  ),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    color: Color(0xff6159E6),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  'About',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 230,
                ),
                Material(
                  borderRadius: BorderRadius.circular(500),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(500),
                    splashColor: Colors.black45,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff9891FF).withOpacity(0.6),
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff6159E6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    // return HomePageBackground(
    //   Scaffold(
    //     backgroundColor: Colors.white,
    //   ),
    // );
  }
}

class HomePageBackground extends StatelessWidget {
  final Widget child;
  const HomePageBackground({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Image.asset('assets/WaveImages/HomeScreenBubbles.png'),
          ),
          Positioned(
            top: 150,
            // left: 20,
            child: Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 30,
                // color: Color(0xff6159E6),
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Material(
              borderRadius: BorderRadius.circular(500),
              child: InkWell(
                borderRadius: BorderRadius.circular(500),
                splashColor: Colors.black45,
                onTap: () {},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: Image.asset(
                      'assets/undraw_male_avatar_323b-removebg-preview.png'),
                  // child: Icon(
                  //   Icons.arrow_back,
                  //   color: Color(0xff6159E6),
                  // ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                height: size.height / 1.8,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   child: Center(
          //       // height: size.height / 1.2,
          //       // color: Colors.black,
          //       // decoration: BoxDecoration(
          //       //   borderRadius: BorderRadius.only(
          //       //     topLeft: Radius.circular(20),
          //       //   ),
          //       //   color: Colors.transparent,
          //       // ),
          //       ),
          // ),
        ],
      ),
    );
  }
}
