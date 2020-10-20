import 'package:Studily/pages/home/home_background.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  HomePageBody({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
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
              // Translucent menu item [child: Builder()]
              child: Builder(
                builder: (context) => Ink(
                  // Uncomment this to add accessability to the drawer

                  //     // decoration: ShapeDecoration(
                  //     //   color: Colors.white.withOpacity(0.2),
                  //     //   shape: RoundedRectangleBorder(
                  //     //     borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     //   ),
                  //     // ),
                  //     // child: IconButton(
                  //     //   icon: Image(
                  //     //     image: AssetImage('assets/logo/studily-logo.png'),
                  //     //   ),
                  //     //   // icon: Icon(
                  //     //   // Icons.menu,
                  //     //   // color: Colors.white.withOpacity(0.8),
                  //     //   // size: 30,
                  //     //   // ),
                  //     //   onPressed: () => Scaffold.of(context).openDrawer(),
                  //     // ),

                  //     // This just adds the logo

                  child: Image(
                    image: AssetImage('assets/logo/studily-logo.png'),
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            titleSpacing: 0,
          ),

          // At this moment, the drawer is unused. To use the drawer just uncomment this
          // and uncomment the menu button

          // drawer: Drawer(
          //   child: Column(
          //     children: <Widget>[
          //       DrawerHeader(
          //         child: Container(
          //           height: 142,
          //           width: MediaQuery.of(context).size.width,
          //           child: Image.asset(
          //             "assets/Studily_avatar.png",
          //           ),
          //         ),
          //         decoration: BoxDecoration(
          //           // borderRadius: BorderRadius.all(Radius.circular(10)),
          //           borderRadius: BorderRadius.only(
          //             bottomRight: Radius.circular(50),
          //             bottomLeft: Radius.circular(50),
          //           ),
          //           color: Color(0xff6159E6),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 40,
          //       ),
          //       GestureDetector(
          //         onTap: () {},
          //         child: Text(
          //           'Profile',
          //           style: TextStyle(
          //             fontFamily: 'Avenir',
          //             fontSize: 24,
          //             fontWeight: FontWeight.w700,
          //           ),
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 45,
          //       ),
          //       GestureDetector(
          //         onTap: () {},
          //         child: Text(
          //           'Settings',
          //           style: TextStyle(
          //             fontFamily: 'Avenir',
          //             fontSize: 24,
          //             fontWeight: FontWeight.w700,
          //           ),
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 45,
          //       ),
          //       Text(
          //         'About',
          //         style: TextStyle(
          //           fontFamily: 'Avenir',
          //           fontSize: 24,
          //           fontWeight: FontWeight.w700,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //       SizedBox(
          //         height: 45,
          //       ),
          //       Text(
          //         'Log Out',
          //         style: TextStyle(
          //           fontFamily: 'Avenir',
          //           fontSize: 24,
          //           fontWeight: FontWeight.w700,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //       SizedBox(
          //         height: 230,
          //       ),
          //       Material(
          //         borderRadius: BorderRadius.circular(500),
          //         child: InkWell(
          //           borderRadius: BorderRadius.circular(500),
          //           splashColor: Colors.black45,
          //           onTap: () {
          //             Navigator.of(context).pop();
          //           },
          //           child: CircleAvatar(
          //             radius: 20,
          //             backgroundColor: Color(0xff9891FF).withOpacity(0.6),
          //             child: Icon(
          //               Icons.arrow_back,
          //               color: Color(0xff6159E6),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ],
    );
  }
}
