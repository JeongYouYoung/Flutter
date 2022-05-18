import 'package:flutter/material.dart';
import 'package:navigator_class_app/screen.dart';
import 'package:navigator_class_app/screen1st.dart';
import 'package:navigator_class_app/screen2ed.dart';

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
        '/' :(context) => const Screen(), // '/' 타입은 screen()으로 가라.
        '/1st' : (context) => const Screen1st(),
        '/2ed' :(context) {
          return const Screen2ed();
        }
      },
      initialRoute: '/', //초기화면 뜨는것. route : 에서 '/'값 설정 해주는것
                         //(=> '/' :(context) => const Screen(),)
    );
  }
}
