import 'package:alert_dialog_ex_app/1st_page.dart';
import 'package:alert_dialog_ex_app/2ed_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //map타입
      routes: {
        '/' :(context) => const Page1(), // '/' 타입은 screen()으로 가라.
        '/page2' : (context) => const Page2ed(),
      },
      initialRoute: '/', //초기화면 뜨는것. route : 에서 '/'값 설정 해주는것
                         //(=> '/' :(context) => const Screen(),)
    );
  }
}