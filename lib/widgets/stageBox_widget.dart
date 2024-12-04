import 'package:festival_tracker_app/objects/userData.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/stageUser_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class StageBox extends StatefulWidget {
  const StageBox({
    Key? key,
    required this.headerColor,
    required this.bodyColor,
    required this.header,
    required this.stageLatitudeOne,
    required this.stageLongitudeOne,
    required this.stageLatitudeTwo,
    required this.stageLongitudeTwo,
    required this.stageLatitudeThree,
    required this.stageLongitudeThree,
    required this.stageLatitudeFour,
    required this.stageLongitudeFour,
  }) : super(key: key);

  final Color headerColor;
  final Color bodyColor;
  final String header;
  final double stageLatitudeOne;
  final double stageLongitudeOne;
  final double stageLatitudeTwo;
  final double stageLongitudeTwo;
  final double stageLatitudeThree;
  final double stageLongitudeThree;
  final double stageLatitudeFour;
  final double stageLongitudeFour;

  @override
  State<StageBox> createState() => _StageBoxState();
}

class _StageBoxState extends State<StageBox> {
  final _database = FirebaseDatabase.instance.ref();

  void closeSheet() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget buildSheet() => DraggableScrollableSheet(
        initialChildSize: 0.8,
        builder: (_, controller) => Container(
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  color: darkColor,
                ),
                child: null,
              ),
              Flexible(
                child: Container(
                  height: double.infinity,
                  color: mainColor,
                  child: StreamBuilder(
                    stream: _database.child("users").onValue,
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      final userWidgetsList = <Widget>[];
                      if (snapshot.hasData) {
                        final myUsers = Map<String, dynamic>.from(
                            (snapshot.data).snapshot.value);
                        myUsers.forEach((key, value) {
                          final usersData = UserData.fromRTDB(
                              Map<String, dynamic>.from(value));
                          final userObject = FullStageUser(
                            imageUrl: usersData.imageUrl,
                            username: usersData.name,
                            lat: usersData.latitude,
                            long: usersData.longitude,
                            gpsTime: usersData.gpsTimeStamp,
                            status: usersData.status,
                            statusTime: usersData.statusTimeStamp,
                          );
                          var s1 = widget.stageLongitudeThree -
                              widget.stageLongitudeOne;
                          var s2 = widget.stageLatitudeThree -
                              widget.stageLatitudeOne;
                          var s3 = widget.stageLongitudeTwo -
                              widget.stageLongitudeOne;
                          var s4 =
                              usersData.longitude - widget.stageLongitudeOne;

                          var w1 = (widget.stageLatitudeOne * s1 +
                                  s4 * s2 -
                                  usersData.latitude * s1) /
                              (s3 * s2 -
                                  (widget.stageLatitudeTwo -
                                          widget.stageLatitudeOne) *
                                      s1);
                          var w2 = (s4 - w1 * s3) / s1;

                          var s5 = widget.stageLongitudeFour -
                              widget.stageLongitudeOne;

                          var w3 = (widget.stageLatitudeOne * s1 +
                                  s4 * s2 -
                                  usersData.latitude * s1) /
                              (s5 * s2 -
                                  (widget.stageLatitudeFour -
                                          widget.stageLatitudeOne) *
                                      s1);
                          var w4 = (s4 - w3 * s5) / s1;

                          if (w1 >= 0 && w2 >= 0 && (w1 + w2) <= 1) {
                            userWidgetsList.add(userObject);
                          } else if (w3 >= 0 && w4 >= 0 && (w3 + w4) <= 1) {
                            userWidgetsList.add(userObject);
                          } else {
                            userWidgetsList.remove(userObject);
                          }
                        });
                      }
                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: userWidgetsList,
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                color: mainColor,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.close_sharp),
                    onPressed: closeSheet,
                    iconSize: 50,
                    color: darkColor,
                  ),
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          isScrollControlled: true,
          context: context,
          builder: (context) => buildSheet()),
      child: SizedBox(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: widget.headerColor,
                      ),
                      width: double.infinity,
                      height: 40,
                      child: Center(
                        child: Text(widget.header,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: widget.bodyColor,
                  ),
                  height: double.infinity,
                  child: StreamBuilder(
                    stream: _database.child("users").onValue,
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      final userWidgetsList = <Widget>[];
                      var counter = 0;
                      if (snapshot.hasData) {
                        final myUsers = Map<String, dynamic>.from(
                            (snapshot.data).snapshot.value);
                        myUsers.forEach((key, value) {
                          final usersData = UserData.fromRTDB(
                              Map<String, dynamic>.from(value));
                          final userObject = StageUser(
                            imageUrl: usersData.imageUrl,
                          );

                          var s1 = widget.stageLongitudeThree -
                              widget.stageLongitudeOne;
                          var s2 = widget.stageLatitudeThree -
                              widget.stageLatitudeOne;
                          var s3 = widget.stageLongitudeTwo -
                              widget.stageLongitudeOne;
                          var s4 =
                              usersData.longitude - widget.stageLongitudeOne;

                          var w1 = (widget.stageLatitudeOne * s1 +
                                  s4 * s2 -
                                  usersData.latitude * s1) /
                              (s3 * s2 -
                                  (widget.stageLatitudeTwo -
                                          widget.stageLatitudeOne) *
                                      s1);
                          var w2 = (s4 - w1 * s3) / s1;

                          var s5 = widget.stageLongitudeFour -
                              widget.stageLongitudeOne;

                          var w3 = (widget.stageLatitudeOne * s1 +
                                  s4 * s2 -
                                  usersData.latitude * s1) /
                              (s5 * s2 -
                                  (widget.stageLatitudeFour -
                                          widget.stageLatitudeOne) *
                                      s1);
                          var w4 = (s4 - w3 * s5) / s1;

                          if (userWidgetsList.length <= 4) {
                            if (w1 >= 0 && w2 >= 0 && (w1 + w2) <= 1) {
                              userWidgetsList.add(userObject);
                            } else if (w3 >= 0 && w4 >= 0 && (w3 + w4) <= 1) {
                              userWidgetsList.add(userObject);
                            } else {
                              userWidgetsList.remove(userObject);
                            }
                          } else {
                            if (w1 >= 0 && w2 >= 0 && (w1 + w2) <= 1) {
                              counter++;
                            } else if (w3 >= 0 && w4 >= 0 && (w3 + w4) <= 1) {
                              counter++;
                            } else {}
                          }
                        });
                        final sumObject = Row(children: [
                          Flexible(
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Text("+$counter"),
                                decoration: BoxDecoration(
                                    color: mainColor, shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ]);
                        if (userWidgetsList.length >= 5) {
                          userWidgetsList.add(sumObject);
                        } else {
                          userWidgetsList.remove(sumObject);
                        }
                      }
                      return GridView.count(
                        primary: false,
                        crossAxisCount: 3,
                        children: userWidgetsList,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
