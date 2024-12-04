import 'package:festival_tracker_app/widgets/notOnStage_widget.dart';
import 'package:flutter/material.dart';
import 'package:festival_tracker_app/widgets/stageBox_widget.dart';
import 'package:festival_tracker_app/style/style.dart';

class StageMap extends StatefulWidget {
  const StageMap({Key? key}) : super(key: key);

  @override
  State<StageMap> createState() => _StageMapState();
}

class _StageMapState extends State<StageMap> {
  var mainStageCoords = [
    47.8232342,
    13.1745359,
    47.8237934,
    13.1755643,
    47.8225409,
    13.1767955,
    47.8219006,
    13.1759173,
  ];

  var hardstyleCoords = [
    47.8201832,
    13.1747584,
    47.8201312,
    13.1759164,
    47.8185398,
    13.1765100,
    47.8184444,
    13.1750849,
  ];

  var clubCircusCoords = [
    47.8228997,
    13.1734045,
    47.8232026,
    13.1737375,
    47.8228792,
    13.1743789,
    47.8225572,
    13.1740552,
  ];
  var heinekenCoords = [
    47.8213749,
    13.1762995,
    47.8214351,
    13.1767667,
    47.8209375,
    13.1767116,
    47.8208759,
    13.1762048,
  ];
  var shutdownCoords = [
    47.8208154,
    13.1758975,
    47.8208113,
    13.1761329,
    47.8203961,
    13.1760469,
    47.8204342,
    13.1757876,
  ];

  var festivalCoords = [
    47.8245225,
    13.1721843,
    47.8243476,
    13.1772694,
    47.8181112,
    13.1784162,
    47.8202733,
    13.1722995,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        primary: false,
        padding: const EdgeInsets.all(15),
        crossAxisSpacing: 25,
        mainAxisSpacing: 45,
        children: [
          StageBox(
            headerColor: mainStageColorH,
            bodyColor: mainStageColor,
            header: 'Mainstage',
            stageLatitudeOne: mainStageCoords[0],
            stageLongitudeOne: mainStageCoords[1],
            stageLatitudeTwo: mainStageCoords[2],
            stageLongitudeTwo: mainStageCoords[3],
            stageLatitudeThree: mainStageCoords[4],
            stageLongitudeThree: mainStageCoords[5],
            stageLatitudeFour: mainStageCoords[6],
            stageLongitudeFour: mainStageCoords[7],
          ),
          StageBox(
            headerColor: hardStyleColorH,
            bodyColor: hardStyleColor,
            header: "Hardstyle Factory",
            stageLatitudeOne: hardstyleCoords[0],
            stageLongitudeOne: hardstyleCoords[1],
            stageLatitudeTwo: hardstyleCoords[2],
            stageLongitudeTwo: hardstyleCoords[3],
            stageLatitudeThree: hardstyleCoords[4],
            stageLongitudeThree: hardstyleCoords[5],
            stageLatitudeFour: hardstyleCoords[6],
            stageLongitudeFour: hardstyleCoords[7],
          ),
          StageBox(
            headerColor: clubCircusColorH,
            bodyColor: clubCircusColor,
            header: "Club Circus",
            stageLatitudeOne: clubCircusCoords[0],
            stageLongitudeOne: clubCircusCoords[1],
            stageLatitudeTwo: clubCircusCoords[2],
            stageLongitudeTwo: clubCircusCoords[3],
            stageLatitudeThree: clubCircusCoords[4],
            stageLongitudeThree: clubCircusCoords[5],
            stageLatitudeFour: clubCircusCoords[6],
            stageLongitudeFour: clubCircusCoords[7],
          ),
          StageBox(
            headerColor: starClubColorH,
            bodyColor: starClubColor,
            header: "Heineken Starclub",
            stageLatitudeOne: heinekenCoords[0],
            stageLongitudeOne: heinekenCoords[1],
            stageLatitudeTwo: heinekenCoords[2],
            stageLongitudeTwo: heinekenCoords[3],
            stageLatitudeThree: heinekenCoords[4],
            stageLongitudeThree: heinekenCoords[5],
            stageLatitudeFour: heinekenCoords[6],
            stageLongitudeFour: heinekenCoords[7],
          ),
          StageBox(
            headerColor: upTempoColorH,
            bodyColor: upTempoColor,
            header: "Shutdown Cave",
            stageLatitudeOne: shutdownCoords[0],
            stageLongitudeOne: shutdownCoords[1],
            stageLatitudeTwo: shutdownCoords[2],
            stageLongitudeTwo: shutdownCoords[3],
            stageLatitudeThree: shutdownCoords[4],
            stageLongitudeThree: shutdownCoords[5],
            stageLatitudeFour: shutdownCoords[6],
            stageLongitudeFour: shutdownCoords[7],
          ),
          Text(""),
          StageBox(
            headerColor: mainDark,
            bodyColor: mainColor,
            header: "Alle am Gelände",
            stageLatitudeOne: festivalCoords[0],
            stageLongitudeOne: festivalCoords[1],
            stageLatitudeTwo: festivalCoords[2],
            stageLongitudeTwo: festivalCoords[3],
            stageLatitudeThree: festivalCoords[4],
            stageLongitudeThree: festivalCoords[5],
            stageLatitudeFour: festivalCoords[6],
            stageLongitudeFour: festivalCoords[7],
          ),
          NotOnStageBox(
            headerColor: notOnFestivalH,
            bodyColor: notOnFestival,
            header: "Nicht am Festival",
            stageLatitudeOne: festivalCoords[0],
            stageLongitudeOne: festivalCoords[1],
            stageLatitudeTwo: festivalCoords[2],
            stageLongitudeTwo: festivalCoords[3],
            stageLatitudeThree: festivalCoords[4],
            stageLongitudeThree: festivalCoords[5],
            stageLatitudeFour: festivalCoords[6],
            stageLongitudeFour: festivalCoords[7],
          ),
        ],
      ),
    );
  }
}
