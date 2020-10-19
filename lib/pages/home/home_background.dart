import 'package:Studily/pages/health/health_page.dart';
import 'package:Studily/pages/money/money_page.dart';
import 'package:Studily/pages/notes/notes_page.dart';
import 'package:Studily/pages/sleeping/sleeping_page.dart';
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
        card_bio: 'Add And Create Notes'),
    CardInfo(
        card_name: 'Sleeping Habits',
        card_image: 'assets/undraw_sleep_analysis_o5f9-removebg-preview.png',
        card_bio: 'Track Your Sleeping Habits'),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        padding: EdgeInsets.only(top: 8.0),
        width: 350,
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color(0xff6159E6),
          elevation: 0,
          child: InkWell(
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
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        CardInfo.card_name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      // width: size.width,
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
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: new Container(
              width: double.infinity,
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity, // This affects the white container
                height: size.height / 1.6,
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
                      children: <Widget>[
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.only(top: 8.0),
                              height: 100.0,
                              width: 350,
                              child: new Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              image: AssetImage(
                                                  cardInfo[0].card_image),
                                            ),
                                          ),
                                        ),
                                      ),
                                      new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                          ),
                                          Text(
                                            cardInfo[0].card_name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            cardInfo[0].card_bio,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotesPage()),
                            );
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.only(top: 8.0),
                              height: 100.0,
                              width: 350,
                              child: new Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              image: AssetImage(
                                                  cardInfo[1].card_image),
                                            ),
                                          ),
                                        ),
                                      ),
                                      new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                          ),
                                          Text(
                                            cardInfo[1].card_name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            cardInfo[1].card_bio,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SleepingPage()),
                            );
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.only(top: 8.0),
                              height: 100.0,
                              width: 350,
                              child: new Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              image: AssetImage(
                                                  cardInfo[2].card_image),
                                            ),
                                          ),
                                        ),
                                      ),
                                      new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                          ),
                                          Text(
                                            cardInfo[2].card_name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            cardInfo[2].card_bio,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthPage()),
                            );
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.only(top: 8.0),
                              height: 100.0,
                              width: 350,
                              child: new Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              image: AssetImage(
                                                  cardInfo[3].card_image),
                                            ),
                                          ),
                                        ),
                                      ),
                                      new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                          ),
                                          Text(
                                            cardInfo[3].card_name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            cardInfo[3].card_bio,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoneyPage()),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
