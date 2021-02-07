import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextTheme mainTextTheme = TextTheme(
  headline3: TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 45.0,
    fontWeight: FontWeight.bold,
    color: Colors.brown,
  ),
  button: TextStyle(
    fontFamily: 'OpenSans',
  ),
  subtitle1: TextStyle(fontFamily: 'NotoSans'),
  bodyText2: TextStyle(fontFamily: 'NotoSans'),
);
ThemeData mainThemeData = ThemeData(
  primarySwatch: Colors.green,
  accentColor: Colors.brown,
  cursorColor: Colors.brown,
  hintColor: Colors.green,
  textTheme: mainTextTheme,
);
