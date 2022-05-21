import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF84AB5C);
const kTextColor = Color(0xFF202E2E);
const kTextLigntColor = Color(0xFF7286A5);

const textInputDecoration = InputDecoration(
    fillColor: Color.fromARGB(255, 175, 209, 138),
    filled: true,
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor, width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)));

const errorDecoration = BoxDecoration(
    color: Color(0xfff6ddde),
    border: Border(
        top: BorderSide(width: 1.0, color: Colors.red),
        left: BorderSide(width: 1.0, color: Colors.red),
        right: BorderSide(width: 1.0, color: Colors.red),
        bottom: BorderSide(width: 1.0, color: Colors.red)));
