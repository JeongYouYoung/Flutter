import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/received_mail.dart';
import 'package:navigator_appbar_ex_app/send_mail.dart';

import 'mail.dart';

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
        '/' :(context) => const mail(), // '/' 타입은 screen()으로 가라.
        '/send' : (context) => const send(),
        '/received' :(context) {
          return const received();
        }
      },
      initialRoute: '/', //초기화면 뜨는것. route : 에서 '/'값 설정 해주는것
                         //(=> '/' :(context) => const Screen(),)
    );
  }
}
