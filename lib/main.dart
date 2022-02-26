import 'package:flutter/material.dart';
import 'package:quran_app/screens/getstarted.dart';
import 'package:quran_app/screens/homepage.dart';
import 'package:quran_app/screens/main_screen.dart';
import 'package:quran_app/screens/read_quran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
