import 'package:background_location/background_location.dart';
import 'package:festival_tracker_app/widgets/customDesign_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'stageMap.dart';
import 'timeTableOverview.dart';
import 'settings.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
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

  //Location to Database
  var uid = FirebaseAuth.instance.currentUser?.uid;
  final db = FirebaseDatabase.instance.ref();

  onStageChecker(
    usersDataLatitude,
    usersDataLongitude,
    stageName,
    ay,
    ax,
    by,
    bx,
    cy,
    cx,
    dy,
    dx,
  ) async {
    final userDB = db.child("users/$uid");
    var s1 = cx - ax;
    var s2 = cy - ay;
    var s3 = bx - ax;
    var s4 = usersDataLongitude - ax;

    var w1 = (ay * s1 + s4 * s2 - usersDataLatitude * s1) /
        (s3 * s2 - (by - ay) * s1);
    var w2 = (s4 - w1 * s3) / s1;

    var s5 = dx - ax;

    var w3 = (ay * s1 + s4 * s2 - usersDataLatitude * s1) /
        (s5 * s2 - (dy - ay) * s1);
    var w4 = (s4 - w3 * s5) / s1;

    if (w1 >= 0 && w2 >= 0 && (w1 + w2) <= 1) {
      print("$stageName True");
      try {
        await userDB.update({
          "onStage": true,
        });
      } catch (e) {
        print("Error");
      }
    } else if (w3 >= 0 && w4 >= 0 && (w3 + w4) <= 1) {
      print("$stageName True");
      try {
        await userDB.update({
          "onStage": true,
        });
      } catch (e) {
        print("Error");
      }
    } else {
      print("false");
      try {
        await userDB.update({
          "onStage": false,
        });
      } catch (e) {
        print("Error");
      }
    }
  }

  FirebaseDatabase database = FirebaseDatabase.instance;

  Future<void> _locationListener() async {
    BackgroundLocation.getLocationUpdates((location) async {
      DatabaseReference userCreatorRef =
          FirebaseDatabase.instance.ref("users/$uid");

      await userCreatorRef.update({
        "latitude": location.latitude,
        "longitude": location.longitude,
        "gpsTimeStamp": DateTime.now().millisecondsSinceEpoch,
        // einen Controller der Fragt true or false auf stage xy
      });
      print(location.latitude);
      print(location.longitude);
      print(DateTime.fromMillisecondsSinceEpoch(location.time!.toInt())
          .toString());

      onStageChecker(
          location.latitude,
          location.longitude,
          "MainStage",
          mainStageCoords[0],
          mainStageCoords[1],
          mainStageCoords[2],
          mainStageCoords[3],
          mainStageCoords[4],
          mainStageCoords[5],
          mainStageCoords[6],
          mainStageCoords[7]);
      onStageChecker(
          location.latitude,
          location.longitude,
          "HardStyle",
          hardstyleCoords[0],
          hardstyleCoords[1],
          hardstyleCoords[2],
          hardstyleCoords[3],
          hardstyleCoords[4],
          hardstyleCoords[5],
          hardstyleCoords[6],
          hardstyleCoords[7]);
    });
    print("Location listener is on!");
  }

  @override
  void initState() {
    super.initState();
    _locationListener();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    StageMap(),
    TimeTableOverview(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Center(
          child: HeaderText(
            text: "Overview",
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(LineIcons.alternateMapMarked, size: 30),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.alternateCalendar, size: 30),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_accounts,
              size: 30,
            ),
            label: 'Status',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: lightColor,
        unselectedItemColor: darkColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
