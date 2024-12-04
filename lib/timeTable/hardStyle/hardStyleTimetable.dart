import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableThree.dart';
import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableTwo.dart';
import 'package:flutter/material.dart';

import 'hardStyleTableOne.dart';
import 'hardStyleTableThree.dart';
import 'hardStyleTableTwo.dart';



class HardStyleTimeTable extends StatefulWidget {
  const HardStyleTimeTable({Key? key}) : super(key: key);

  @override
  State<HardStyleTimeTable> createState() => _HardStyleTimeTableState();
}

class _HardStyleTimeTableState extends State<HardStyleTimeTable> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        HardStylePageOne(),
        HardStylePageTwo(),
        HardStylePageThree()
      ],
    );
  }
}
