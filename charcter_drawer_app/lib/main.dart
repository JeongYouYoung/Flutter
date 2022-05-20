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
        primarySwatch: Colors.blue,
      ),
      home: const Led(),
    );
  }
}

class Led extends StatefulWidget {
  const Led({Key? key}) : super(key: key);

  @override
  State<Led> createState() => _LedState();
}

class _LedState extends State<Led> {
  late TextEditingController apple;
  late String show_apple;
  late List add_apple;
  late int num;

  @override
  void initState() {
    super.initState();
    apple = TextEditingController();
    show_apple = "";
    add_apple = [];
    num = 0;

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      showAD();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("LED 광고"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(show_apple,
            style: TextStyle(
              fontSize: 30,
              
            ),)],
          ),
        ),
        drawer: Drawer(
          child: Center(
              child: Column(
            children: [
              Container(
                //child 하나만 가지고있음.
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("광고 문구를 입력하세요"),
                  ],
                ),
                width: 320,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
              ),
              TextField(
                controller: apple,
                decoration: const InputDecoration(labelText: "문구를 입력하세요"),
                keyboardType: TextInputType.text,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    add_apple = apple.text.split("");
                    show_apple = add_apple[0];
                  },
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    side: const BorderSide(color: Colors.red, width: 2.0),
                  ),
                  child: const Text("광고문구 생성"))
            ],
          )),
        ));
  }

  showAD() {
    setState(() {
      if (num == add_apple.length) {
        num = 1;
        show_apple = add_apple[0];
      } else {
        show_apple += add_apple[num];
        num++;
      }
    });
  }
}// end