import 'package:flutter/material.dart';
import 'package:festival_tracker_app/objects/djData.dart';
import 'package:festival_tracker_app/objects/userData.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/stageUser_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../widgets/customDesign_widgets.dart';
import '../../widgets/timeTable_widget.dart';

class HeinekenPageThree extends StatefulWidget {
  const HeinekenPageThree({Key? key}) : super(key: key);

  @override
  State<HeinekenPageThree> createState() => _HeinekenPageThreeState();
}

class _HeinekenPageThreeState extends State<HeinekenPageThree> {
  List<String> djNames = [
    'LUCAZ',
    'SANNY',
    'DAVID BACHETTI',
    'RAVEPARADE',
    'FLIP CAPELLA',
    'POWER HOUR, DJ SELECTA',
    'PANA',
    'ELI PREISS',
    'DAN GEROUS',
    'KATJA KRASAVICE',
    'DJ WG ABRISS, FELICE, TOBY ROMEO',
  ];

  List<String> djTime = [
    '16:30 - 17:15',
    '17:15 - 18:00',
    '18:00 - 19:00',
    '19:00 - 20:00',
    '20:00 - 21:00',
    '21:00 - 22:00',
    '22:00 - 23:00',
    '23:15 - 00:00',
    '00:00 - 00:45',
    '01:00 - 02:00',
    '02:00 - 03:00',
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
          "Heineken (Samstag)",
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
