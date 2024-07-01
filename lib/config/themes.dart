import 'package:flutter/material.dart';

// Define your custom font family
const String kFontFamily = 'Rotunda';
const Color kLightLabelColor = Color(0XFF5F6561);
const Color kLabelColor = Color(0XFFF6F6F6);
const Color kBackgroundColor = Color(0XFF111111);
// const String kApikey = "b7ba817db0bcafbaf9eee9141011fc7a";

// Define text styles
const TextStyle kDisplayLarge = TextStyle(
  fontFamily: kFontFamily,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle kBodyLarge = TextStyle(
  fontFamily: kFontFamily,
  fontSize: 16,
);
const TextStyle kTabLabelStyle =
    TextStyle(fontFamily: kFontFamily, fontWeight: FontWeight.w400);
// Define ThemeData
ThemeData kThemeData = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kBackgroundColor,
  textTheme: const TextTheme(
    displayLarge: kDisplayLarge,
    bodyLarge: kBodyLarge,
  ),
  tabBarTheme: const TabBarTheme(
    dividerColor: Colors.transparent,
    labelStyle: kTabLabelStyle,
    unselectedLabelStyle: kTabLabelStyle,
    labelColor: kLabelColor,
    unselectedLabelColor: kLightLabelColor,
    indicator: BoxDecoration(),
    tabAlignment: TabAlignment.start,
  ),
  // Define other theme properties like button themes, app bars, etc.
);
