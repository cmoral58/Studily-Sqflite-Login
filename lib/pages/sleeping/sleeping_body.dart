import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SleepingBody extends StatefulWidget {
  SleepingBody({Key key}) : super(key: key);

  @override
  _SleepingBodyState createState() => _SleepingBodyState();
}

class _SleepingBodyState extends State<SleepingBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 550,
          child: new Container(
            height: size.height * 0.15,
            width: size.width * 1,
            child: Stack(
              children: <Widget>[
                SfCalendar(
                  view: CalendarView.month,
                  monthViewSettings: MonthViewSettings(
                    numberOfWeeksInView: 1,
                    dayFormat: 'EEE',
                    agendaViewHeight: 2,
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
