import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableThree.dart';
import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableTwo.dart';
import 'package:flutter/material.dart';

import 'heinekenTableOne.dart';
import 'heinekenTableThree.dart';
import 'heinekenTableTwo.dart';



class HeinekenTimeTable extends StatefulWidget {
  const HeinekenTimeTable({Key? key}) : super(key: key);

  @override
  State<HeinekenTimeTable> createState() => _HeinekenTimeTableState();
}

class _HeinekenTimeTableState extends State<HeinekenTimeTable> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        HeinekenPageOne(),
        HeinekenPageTwo(),
        HeinekenPageThree()
      ],
    );
  }
}
