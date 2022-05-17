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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Fitting"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
            ),
               Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              fit: BoxFit.contain,//contain : 비율에 맞게 짤리지 않게(기본값)
            ),
             Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              fit: BoxFit.fill,//fill : 맞춰줘서 그려주는것.
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              fit: BoxFit.cover,//cover : 이미지가 짤릴수도 있다.
            ),
          ],
        ),
      ),
    );
  }
}
