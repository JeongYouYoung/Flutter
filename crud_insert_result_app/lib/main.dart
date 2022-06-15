import 'dart:convert';

import 'package:crud_insert_result_app/delete_page.dart';
import 'package:crud_insert_result_app/insert_page.dart';
import 'package:crud_insert_result_app/list_page.dart';
import 'package:crud_insert_result_app/update_page.dart';
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
        '/':(context) => const ListPage(),
        '/insert':(context) => const InsertPage(),
        '/update':(context) => const UpdatePage(),
        '/delete':(context) => const DeletePage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 000, 153, 102),
        ),
        primarySwatch: Colors.green,
      ),
      
    );
  }
}

