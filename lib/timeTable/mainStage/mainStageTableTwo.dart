import 'package:flutter/material.dart';
import 'package:festival_tracker_app/objects/djData.dart';
import 'package:festival_tracker_app/objects/userData.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/stageUser_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../widgets/customDesign_widgets.dart';
import '../../widgets/timeTable_widget.dart';

class MainStagePageTwo extends StatefulWidget {
  const MainStagePageTwo({Key? key}) : super(key: key);

  @override
  State<MainStagePageTwo> createState() => _MainStagePageTwoState();
}

class _MainStagePageTwoState extends State<MainStagePageTwo> {
  List<String> djNames = [
    'TWO KINX',
    'PASCAL LETOUBLON',
    'RENE RODRIGEZZ',
    'ROBIN SCHULZ',
    'KSHMR',
    'TOBY ROMEO',
    'ACRAZE',
    'YELLOW CLAW',
    'W&W',
    'TIMMY TRUMPET',
  ];

  List<String> djTime = [
    '16:30 - 17:30',
    '17:30 - 18:30',
    '18:30 - 19:25',
    '19:25 - 20:25',
    '20:25 - 21:25',
    '21:25 - 22:00',
    '22:00 - 23:00',
    '23:00 - 00:00',
    '00:00 - 01:00',
    '01:00 - 02:00',
  ];

  Widget buildList() => ListView.builder(
      itemCount: djNames.length,
      itemBuilder: (context, index) {
        final dj = djNames[index];
        final time = djTime[index];

        return Container(
          child: ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: mainColor, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            leading: Text(
              index.toString(),
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            title: Text(
              dj,
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              time,
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Mainstage (Freitag)",
          style: TextStyle(
            fontSize: 25,
            color: backgroundColor,
          ),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: buildList(),
      ),
    );
  }
}
