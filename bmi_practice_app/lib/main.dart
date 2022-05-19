import 'package:bmi_practice_app/bmi/bmi_check_page.dart';
import 'package:bmi_practice_app/bmi/bmi_cilck_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context) => const Bmi_click_page(),
        '/bc' :(context) => const Bmi_check_page(),
      },
      initialRoute: '/',
    );
  }
}
