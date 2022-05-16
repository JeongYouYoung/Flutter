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
            Text(
              "유비"
            ),
            Text(
              "관우"
            ),
            Text(
              "장비"
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "조조"
            ),
            Text(
              "여포"
            ),
            Text(
              "동탁"
            ),
         ]
        ),
      ),
    );
  }
}
