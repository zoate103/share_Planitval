import 'package:flutter/material.dart';

class TimeTableItem extends StatefulWidget {
  const TimeTableItem(
      {Key? key, required this.number, required this.name, required this.time})
      : super(key: key);

  final int number;
  final String name;
  final String time;

  @override
  State<TimeTableItem> createState() => _TimeTableItemState();
}

class _TimeTableItemState extends State<TimeTableItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(widget.number.toString()),
        title: Text(widget.name),
        subtitle: Text(widget.time),
      ),
    );
  }
}
