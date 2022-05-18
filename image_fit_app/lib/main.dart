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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/turtle.gif',
              width: 150,
              height: 150,
            ),
               Image.asset(
              'images/turtle.gif',
              width: 150,
              height: 150,
              //contain : 비율에 맞게 짤리지 않게(기본값)
              fit: BoxFit.contain,
            ),
             Image.asset(
              'images/turtle.gif',
              width: 150,
              height: 150,
              //fill : 맞춰줘서 그려주는것.
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 150,
              height: 150,
              //cover : 이미지가 짤릴수도 있다.
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
