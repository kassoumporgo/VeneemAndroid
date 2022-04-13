import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../constants/colors.dart';


class Themes {

  final lightTheme = ThemeData.light().copyWith(

    // fontFamily: 'app_font',

    scaffoldBackgroundColor: lightScaffoldBackgroundColor,

    textTheme: const TextTheme(
      headline1: TextStyle(color: lightTextColor),
      headline2: TextStyle(color: lightTextColor),
      headline3: TextStyle(color: lightTextColor),
      headline4: TextStyle(color: lightTextColor),
      headline5: TextStyle(color: lightTextColor),
      headline6: TextStyle(color: lightTextColor),
      subtitle1: TextStyle(color: lightTextColor),
      subtitle2: TextStyle(color: lightTextColor),
      bodyText1: TextStyle(color: lightTextColor),
      bodyText2: TextStyle(color: lightTextColor),
      button: TextStyle(color: lightTextColor),
      caption: TextStyle(color: lightTextColor),
    ),

    iconTheme: const IconThemeData(color: Colors.black87),

  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),

  );


  final dartTheme = ThemeData.dark().copyWith(

    // fontFamily: 'app_font',

    scaffoldBackgroundColor: darkScaffoldBackgroundColor,

    textTheme: const TextTheme(
      headline1: TextStyle(color: darkTextColor),
      headline2: TextStyle(color: darkTextColor),
      headline3: TextStyle(color: darkTextColor),
      headline4: TextStyle(color: darkTextColor),
      headline5: TextStyle(color: darkTextColor),
      headline6: TextStyle(color: darkTextColor),
      subtitle1: TextStyle(color: darkTextColor),
      subtitle2: TextStyle(color: darkTextColor),
      bodyText1: TextStyle(color: darkTextColor),
      bodyText2: TextStyle(color: darkTextColor),
      button: TextStyle(color: darkTextColor),
      caption: TextStyle(color: darkTextColor),
    ),

    iconTheme: const IconThemeData(color: darkIconColor),

  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

}