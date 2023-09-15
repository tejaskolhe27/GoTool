import 'package:farmer_app/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter App",
      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        // colorScheme: ColorScheme.fromSwatch(
        // primarySwatch:Color(0xff1e9486),
        // )
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
