import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    labelStyle: TextStyle(color: outLineBorder),
    labelText: hintText,
    hintText: hintText,
    prefixIcon: Icon(icon, color: Color.fromARGB(50, 62, 72, 1)),
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: outLineBorder),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
