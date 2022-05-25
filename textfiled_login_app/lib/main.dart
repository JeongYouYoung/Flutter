import 'package:flutter/material.dart';
import 'package:textfiled_login_app/animal/animal_main.dart';
import 'package:textfiled_login_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        '/':(context) => const LogInPage(),
        '/animain':(context) => const AnimalMain(),
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
