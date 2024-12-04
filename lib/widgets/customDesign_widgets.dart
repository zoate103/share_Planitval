import 'package:festival_tracker_app/style/style.dart';
import 'package:flutter/material.dart';

class MainTextButton extends StatelessWidget {
  const MainTextButton(
      {Key? key, required this.onPressFunction, required this.buttonText})
      : super(key: key);
  final String buttonText;
  final Function() onPressFunction;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressFunction,
      child: Text(buttonText),
      style: OutlinedButton.styleFrom(
        foregroundColor: mainColor,
        minimumSize: Size(230, 50),
        side: const BorderSide(color: mainColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class TimeTableTextButton extends StatelessWidget {
  const TimeTableTextButton(
      {Key? key,
      required this.onPressFunction,
      required this.buttonText,
      required this.color})
      : super(key: key);
  final String buttonText;
  final Function() onPressFunction;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressFunction,
      child: Text(buttonText),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        minimumSize: const Size(230, 50),
        side: BorderSide(color: color, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class MainTextInputField extends StatelessWidget {
  MainTextInputField(
      {Key? key,
      required this.mainTextController,
      required this.inputText,
      myFocusNode})
      : super(key: key);

  final TextEditingController mainTextController;
  final String inputText;

  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: mainColor, fontWeight: FontWeight.bold),
      controller: mainTextController,
      decoration: InputDecoration(
          labelText: inputText,
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: myFocusNode.hasFocus ? mainColor : mainColor),
          fillColor: darkColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: darkColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: mainColor, width: 2))),
    );
  }
}

class MainUserTextInputField extends StatelessWidget {
  MainUserTextInputField(
      {Key? key,
      required this.mainTextController,
      required this.inputText,
      myFocusNode})
      : super(key: key);

  final TextEditingController mainTextController;
  final String inputText;

  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 8,
      style: const TextStyle(color: mainColor, fontWeight: FontWeight.bold),
      controller: mainTextController,
      decoration: InputDecoration(
          labelText: inputText,
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: myFocusNode.hasFocus ? mainColor : mainColor),
          fillColor: darkColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: darkColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: mainColor, width: 2))),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: darkColor));
  }
}

class MainPhoneTextInputField extends StatelessWidget {
  MainPhoneTextInputField(
      {Key? key,
      required this.mainTextController,
      required this.inputText,
      myFocusNode})
      : super(key: key);

  final TextEditingController mainTextController;
  final String inputText;

  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      style: const TextStyle(color: mainColor, fontWeight: FontWeight.bold),
      controller: mainTextController,
      decoration: InputDecoration(
          labelText: inputText,
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: myFocusNode.hasFocus ? mainColor : mainColor),
          fillColor: darkColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: darkColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: mainColor, width: 2))),
    );
  }
}
