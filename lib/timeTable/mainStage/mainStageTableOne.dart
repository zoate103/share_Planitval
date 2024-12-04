import 'package:flutter/material.dart';
import 'package:festival_tracker_app/objects/djData.dart';
import 'package:festival_tracker_app/objects/userData.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/stageUser_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../widgets/customDesign_widgets.dart';
import '../../widgets/timeTable_widget.dart';

class MainStagePageOne extends StatefulWidget {
  const MainStagePageOne({Key? key}) : super(key: key);

  @override
  State<MainStagePageOne> createState() => _MainStagePageOneState();
}

class _MainStagePageOneState extends State<MainStagePageOne> {
  List<String> djNames = [
    'MEDUN',
    'FLIP CAPELLA',
    'VIZE',
    'ALAN WALKER',
    'KYGO',
    'FELICE',
    'OPENING',
    'DON DIABLO',
    'STEVE AOKI',
    'ARMIN VAN BUUREN',
  ];

  List<String> djTime = [
    '16:30 - 17:30',
    '17:30 - 18:15',
    '18:15 - 19:15',
    '19:15 - 20:15',
    '20:20 - 21:20',
    '21:30 - 22:30',
    '22:30 - 22:50',
    '22:55 - 23:55',
    '23:55 - 00:55',
    '00:55 - 02:00',
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
          "Mainstage (Donnerstag)",
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
