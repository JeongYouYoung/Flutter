import 'dart:async';

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
        primarySwatch: Colors.grey,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Propert
  late String korea;
  late String ledAd;
  late List kor;
  late int num;

  @override
  void initState() {
    super.initState();
    num = 1;
    korea = "대한민국";
    kor = korea.split('');
    ledAd = kor[0];

    Timer.periodic(const Duration(seconds: 01), (Timer timer) {
      changText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LED 광고',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ledAd,
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }

  changText() {
    setState(() {
      if (num == kor.length) {
        num = 1;
        ledAd = kor[0];
      } else {
        ledAd += kor[num];
        num++;
      }
    });
  }
}//end
