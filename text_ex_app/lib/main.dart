import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //키값소문자로 시작,class는 대문자로 시작
      appBar: AppBar(
        title: const Text(
          "Text Exercise 01"
        ),
        centerTitle: false,
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Column(//여러 줄이 필요하니까 Column[]을 사용하는거
                      //하나만 쓰면 child, 여러개 쓰면 children
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
                       Divider(//선긋기
              height: 20,
              color: Colors.grey,
              thickness: 1.5,
            ),
 
            Text(
              "유비"
            ),
            Text(
              "관우"
            ),
            Text(
              "장비"
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Divider(//선긋기
              height: 20,
              color: Colors.grey,
              thickness: 1.5,
            ),
            Text(
              "조조",//TextStyle 모르면 TextStyle쳐서 확인해봐
              style: TextStyle(
                color: Colors.blue,//글자 색깔
                fontSize: 28,//글자 사이즈
                fontWeight: FontWeight.bold,//글자 굵기
                letterSpacing: 5,//글자 간격
              ),
            ),
            Text(
              "여포"
            ),
            Text(
              "동탁"
            ),
                       Divider(//선긋기
              height: 20,
              color: Colors.grey,
              thickness: 1.5,
            )
 
         ]
        ),
      ),
    );
  }
}
