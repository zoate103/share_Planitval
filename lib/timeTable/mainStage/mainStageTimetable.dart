import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableThree.dart';
import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableTwo.dart';
import 'package:flutter/material.dart';

import 'mainStageTableOne.dart';



class MainStageTimeTable extends StatefulWidget {
  const MainStageTimeTable({Key? key}) : super(key: key);

  @override
  State<MainStageTimeTable> createState() => _MainStageTimeTableState();
}

class _MainStageTimeTableState extends State<MainStageTimeTable> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        MainStagePageOne(),
        MainStagePageTwo(),
        MainStagePageThree()
      ],
    );
  }
}
