import 'package:flutter/material.dart';
import 'package:festival_tracker_app/objects/djData.dart';
import 'package:festival_tracker_app/objects/userData.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/stageUser_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../widgets/customDesign_widgets.dart';
import '../../widgets/timeTable_widget.dart';

class ClubCircusPageThree extends StatefulWidget {
  const ClubCircusPageThree({Key? key}) : super(key: key);

  @override
  State<ClubCircusPageThree> createState() => _ClubCircusPageThreeState();
}

class _ClubCircusPageThreeState extends State<ClubCircusPageThree> {
  List<String> djNames = [
    'MODUL KOLLEKTIV',
    'MARK MICHAEL',
    'STEVE LOONEY',
    'ANNA ULLRICH',
    'LILLY PALMER',
    'ARTBAT',
    'CHARLOTTE DE WITTE',
  ];

  List<String> djTime = [
    '16:30 - 17:30',
    '17:30 - 18:30',
    '18:30 - 20:00',
    '20:00 - 22:00',
    '22:00 - 00:00',
    '00:00 - 02:00',
    '02:00 - 04:00',
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
          "Club Circus (Samstag)",
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