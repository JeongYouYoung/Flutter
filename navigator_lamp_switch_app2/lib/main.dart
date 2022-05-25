import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app2/controller.dart';
import 'package:navigator_lamp_switch_app2/message.dart';

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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//노란색 전구필요
  late String _lampImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampImage = "images/lamp_on.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main화면"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Controller();
              })).then((value) => getData()); //내가 부른놈 위치로 온다
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: Image.asset(
          _lampImage,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
  //Function-----------------

  getData() {
    //Message상태 확인하는 함수
    setState(() {
      if (Message.lampStatus == true) {
        if (Message.lampColor == true) {
          _lampImage = "images/lamp_on.png";
        } else {
          _lampImage = "images/lamp_red.png";
        }
      } else {
        _lampImage = "images/lamp_off.png";
      }
    });
  }
}//end
