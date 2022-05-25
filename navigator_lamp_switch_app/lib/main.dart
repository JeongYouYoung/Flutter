import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/first_page.dart';
import 'package:navigator_lamp_app/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context) => const FirtstPage(),
        '/2ed':(context) => const SecondPage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
    );
  }
}
