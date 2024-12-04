import 'package:flutter/material.dart';
import 'package:festival_tracker_app/objects/djData.dart';
import 'package:festival_tracker_app/objects/userData.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/stageUser_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../widgets/customDesign_widgets.dart';
import '../../widgets/timeTable_widget.dart';

class HardStylePageThree extends StatefulWidget {
  const HardStylePageThree({Key? key}) : super(key: key);

  @override
  State<HardStylePageThree> createState() => _HardStylePageThreeState();
}

class _HardStylePageThreeState extends State<HardStylePageThree> {
  List<String> djNames = [
    'HIGH LEVEL',
    'ETERNATE',
    'RETROSPECT',
    'PRIMESHOCK',
    'HEADHUNTERZ',
    'COONE',
    'CODEBLACK',
    'E-FORCE',
    'PARTYRAISER',
    'CLOSING',
  ];

  List<String> djTime = [
    '16:30 - 17:00',
    '17:00 - 18:00',
    '18:00 - 19:00',
    '19:00 - 20:15',
    '20:15 - 21:30',
    '21:30 - 22:30',
    '22:30 - 23:30',
    '23:30 - 00:30',
    '00:30 - 01:45',
    '01:45 - 02:00',
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
          "Hardstyle (Samstag)",
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