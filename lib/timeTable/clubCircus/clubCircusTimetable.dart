import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableThree.dart';
import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableTwo.dart';
import 'package:flutter/material.dart';

import 'clubCircusTableOne.dart';
import 'clubCircusTableThree.dart';
import 'clubCircusTableTwo.dart';



class ClubCircusTimeTable extends StatefulWidget {
  const ClubCircusTimeTable({Key? key}) : super(key: key);

  @override
  State<ClubCircusTimeTable> createState() => _ClubCircusTimeTableState();
}

class _ClubCircusTimeTableState extends State<ClubCircusTimeTable> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        ClubCircusPageOne(),
        ClubCircusPageTwo(),
        ClubCircusPageThree()
      ],
    );
  }
}
