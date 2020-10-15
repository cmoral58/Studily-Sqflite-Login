import 'package:Studily/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/WaveImages/HomeScreenBubbles.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          body: Container(
            child: HomePageBody(),
            color: Colors.transparent,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Builder(
                builder: (context) => Ink(
                  decoration: ShapeDecoration(
                    color: Color(0xff9891FF).withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Color(0xff6159E6),
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
                SizedBox(
                  height: 30,
                ),
                DrawerHeader(
                  child: Container(
                    height: 142,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/Studily_avatar.png",
                      height: 70, // These things also do nothing
                      width: 70, // These things also do nothing
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
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
    return HomePageBackground(
      child: Scaffold(),
    );
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
            top: 20,
            child: Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff6159E6),
              ),
            ),
          ),
          // Positioned(
          //   top: 0,
          //   child: Image.asset('assets/WaveImages/HomeScreenBubbles.png'),
          // ),
        ],
      ),
    );
  }
}
