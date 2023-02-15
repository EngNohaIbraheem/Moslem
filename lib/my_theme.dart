import 'package:flutter/material.dart';

class MyTheme {

  static const Color colorGold = Color(0xFFB7935F);
  static const Color colorYellow = Color(0xFFFACC1D);
  static const Color colorDarkBlue = Color(0xFF141A2E);


  static final ThemeData lightTheme = ThemeData(
      primaryColor: colorGold,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontFamily: 'ElMessiri',
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: colorGold,
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.white,
      ),
      textTheme: const TextTheme(
         bodyText1: TextStyle(
            fontSize: 18, color: Colors.black, fontFamily: 'ElMessiri'),

        headline3: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'ElMessiri'),
        headline4:
        TextStyle(fontSize: 28, color: Colors.black, fontFamily: 'ElMessiri'),
        headline5: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontFamily: 'ElMessiri',
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white
      )
  );

  static final ThemeData darkTheme = ThemeData(
       primaryColor: colorYellow,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: 'ElMessiri',
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: colorDarkBlue,
        selectedIconTheme: IconThemeData(color:colorYellow),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(color: colorYellow),
        selectedItemColor: colorYellow,
        unselectedItemColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18, color: Colors.white, fontFamily: 'ElMessiri'),

        headline3: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'ElMessiri'),
        headline4:
        TextStyle(fontSize: 28, color: Colors.white, fontFamily: 'ElMessiri'),
        headline5: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontFamily: 'ElMessiri',
        ),
      ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: colorDarkBlue
    )


  );
}
