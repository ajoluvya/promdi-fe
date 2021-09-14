import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class FloatingButton extends StatelessWidget {
  final VoidCallback onClicked;
  final IconData iconData;
  const FloatingButton(
      {Key? key, required this.onClicked, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: lightBlue,
      onPressed: onClicked,
      tooltip: 'Increment',
      child: Icon(iconData),
    );
  }
}
