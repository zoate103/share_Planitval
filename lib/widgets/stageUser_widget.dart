import 'package:flutter/material.dart';

class StageUser extends StatefulWidget {
  const StageUser({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  State<StageUser> createState() => _StageUserState();
}

class _StageUserState extends State<StageUser> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundImage: NetworkImage(widget.imageUrl),
          radius: 20.0,
        ),
      ),
    ]);
  }
}

class FullStageUser extends StatefulWidget {
  const FullStageUser({
    Key? key,
    required this.username,
    required this.imageUrl,
    required this.lat,
    required this.long,
    required this.gpsTime,
    required this.status,
    required this.statusTime,
  }) : super(key: key);

  @override
  State<FullStageUser> createState() => _FullStageUserState();

  final String username;
  final String imageUrl;
  final double lat;
  final double long;
  final DateTime gpsTime;
  final String status;
  final DateTime statusTime;
}

class _FullStageUserState extends State<FullStageUser> {
  _dismissDialog() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  title: Text(widget.username),
                  content: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(children: [
                          Text("Status:"),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Tooltip(
                              message: widget.statusTime.toString(),
                              child: Icon(Icons.help_sharp),
                            ),
                          )
                        ]),
                        Row(children: [
                          Flexible(child: Text("${widget.status}"))
                        ]),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                            )
                          ],
                        ),
                        Row(children: [
                          Text("Location:"),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Tooltip(
                              message: widget.gpsTime.toString(),
                              child: Icon(Icons.help_sharp),
                            ),
                          )
                        ]),
                        Row(
                          children: [Text("Latitude ${widget.lat.toString()}")],
                        ),
                        Row(
                          children: [
                            Text("Longitude ${widget.long.toString()}")
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          _dismissDialog();
                        },
                        child: Text('Close')),
                    TextButton(
                      onPressed: () {
                        ;
                        _dismissDialog();
                      },
                      child: Text('Track'),
                    )
                  ],
                );
              });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.imageUrl),
              radius: 35.0,
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  widget.username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
        ),
      ),
    ]);
  }
}
