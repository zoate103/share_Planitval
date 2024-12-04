import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableThree.dart';
import 'package:festival_tracker_app/timeTable/mainStage/mainStageTableTwo.dart';
import 'package:flutter/material.dart';

import 'shutdownTableOne.dart';
import 'shutdownTableThree.dart';
import 'shutdownTableTwo.dart';



class ShutdownTimeTable extends StatefulWidget {
  const ShutdownTimeTable({Key? key}) : super(key: key);

  @override
  State<ShutdownTimeTable> createState() => _ShutdownTimeTableState();
}

class _ShutdownTimeTableState extends State<ShutdownTimeTable> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        ShutdownPageOne(),
        ShutdownPageTwo(),
        ShutdownPageThree()
      ],
    );
  }
}
