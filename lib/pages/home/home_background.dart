import 'package:flutter/material.dart';
import 'package:Studily/components/card_info.dart';

// ignore: must_be_immutable
class HomePageBackground extends StatelessWidget {
  final Widget child;
  HomePageBackground({
    // Previously had const
    Key key,
    @required this.child,
  }) : super(key: key);

  List<CardInfo> cardInfo = [
    CardInfo(
        card_name: 'Notes/Todos',
        card_image:
            'assets/undraw_Personal_notebook_re_d7dc-removebg-preview.png',
        card_bio: 'Todo Lists'),
    CardInfo(
        card_name: 'Sleeping Habits',
        card_image: 'assets/undraw_sleep_analysis_o5f9-removebg-preview.png',
        card_bio: 'Track Sleeping Habits'),
    CardInfo(
        card_name: 'Health Tracker',
        card_image: 'assets/undraw_healthy_habit_bh5w-removebg-preview.png',
        card_bio: 'Manage Your Health'),
    CardInfo(
        card_name: 'Manage Money',
        card_image: 'assets/undraw_wallet_aym5-removebg-preview.png',
        card_bio: 'Manage Your Money'),
  ];

  // ignore: non_constant_identifier_names
  Widget PagesCardInfo(CardInfo) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Color(0xff6159E6),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 50.0,
                    width: 100.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(CardInfo.card_image),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      CardInfo.card_name,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text(
                      CardInfo.card_bio,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
            top: 50,
            right: 25,
            child: Material(
              borderRadius: BorderRadius.circular(500),
              child: InkWell(
                borderRadius: BorderRadius.circular(500),
                onTap: () {},
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                    'assets/Studily_avatar.png',
                  ),
                  backgroundColor: Color(0xff6159E6),
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 30,
            child: Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Roboto',
                color: Colors.white,
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
                child: Column(
                  children: <Widget>[
                    Column(
                      children: cardInfo.map((p) {
                        return PagesCardInfo(p);
                      }).toList(),
                    )
                  ],
                ),
                // child: ListView(
                //   // padding: const EdgeInsets.symmetric(vertical: 20),
                //   children: <Widget>[
                //     new Container(
                //       height: size.height / 1.8,
                //       child: ListView(
                //         scrollDirection: Axis.vertical,
                //         children: <Widget>[],
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
