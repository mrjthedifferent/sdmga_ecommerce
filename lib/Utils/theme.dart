import 'package:flutter/material.dart';

ThemeData myThemeData() {
  return ThemeData(
    primarySwatch: Colors.blue,
    textTheme: myTextTheme(),
    appBarTheme: myAppBarTheme(),
    inputDecorationTheme: myInputDecorationTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(style: myButtonStyle()),
  );
}

ButtonStyle myButtonStyle() {
  return ElevatedButton.styleFrom(
    minimumSize: Size.fromHeight(48),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

InputDecorationTheme myInputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    gapPadding: 10.0,
    borderRadius: BorderRadius.circular(30.0),
    borderSide: const BorderSide(
      width: 2.0,
      color: Colors.grey,
    ),
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
  );
}

TextTheme myTextTheme() {
  return TextTheme(
    headline4: TextStyle(
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      color: Colors.grey[600],
    ),
  );
}

AppBarTheme myAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: Color(0xffF5F5F5),
    elevation: 0.0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.grey),
    titleTextStyle: TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
