import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/customDesign_widgets.dart';
import 'package:flutter/material.dart';

import '../timeTable/clubCircus/clubCircusTimetable.dart';
import '../timeTable/hardStyle/hardStyleTimetable.dart';
import '../timeTable/heineken/heinekenTimetable.dart';
import '../timeTable/mainStage/mainStageTableOne.dart';
import '../timeTable/mainStage/mainStageTimetable.dart';
import '../timeTable/shutdown/shutdownTimetable.dart';


class TimeTableOverview extends StatefulWidget {
  const TimeTableOverview({Key? key}) : super(key: key);

  @override
  State<TimeTableOverview> createState() => _TimeTableOverviewState();
}

class _TimeTableOverviewState extends State<TimeTableOverview> {
  void mainStageNav(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainStageTimeTable())
    );
  }

  void hardStyleNav(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HardStyleTimeTable())
    );
  }

  void clubCircusNav(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClubCircusTimeTable())
    );
  }

  void heinekenNav(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HeinekenTimeTable())
    );
  }

  void shutdownNav(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShutdownTimeTable())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          const Text("TIMETABLE", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: mainColor),),
          SizedBox(
            height: 40,
          ),
          Container(
            child: TimeTableTextButton(onPressFunction: mainStageNav, buttonText: "Mainstage", color: mainStageColor),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: TimeTableTextButton(onPressFunction: hardStyleNav, buttonText: "Hardstyle Factory", color: hardStyleColor),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: TimeTableTextButton(onPressFunction: clubCircusNav, buttonText: "Club Circus", color: clubCircusColor),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: TimeTableTextButton(onPressFunction: heinekenNav, buttonText: "Heineken Starclub", color: starClubColor),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: TimeTableTextButton(onPressFunction: shutdownNav, buttonText: "Shutdown Cave", color: upTempoColor),
          )
        ],
      ),
    );
  }
}
