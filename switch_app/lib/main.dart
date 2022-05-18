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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool switchValue;
  late String _button;
  late Color _buttonColor;

  @override
  void initState() {
    switchValue = false;
    _button = "Flutter";
    _buttonColor = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Changed Button color on Switch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //_onClick();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_buttonColor)),
              child: Text(_button),
            ),
            const SizedBox(
              height: 30,
            ),
            Switch(
              value: switchValue, // <- 화면에 보이는값.
              //onChanged(변수) : 변수가 필요함
              //화면에 보여지는 스위치 모양은 위에 벨류 : value: switchValue
              //아래 벨류는 사용자가 움직이는 벨류 : onChanged: (Value)
              onChanged: (value) {
                // 빌드로 바뀐정보를 알려주는애 : setState
                //빌드로 알려줘야 화면이 바뀜.
                setState(
                  () {
                    switchValue = value;
                    if (switchValue == false) {
          _button = "Flutter1";
          _buttonColor = Colors.blue;
        } else {
          _button = "Flutter2";
          _buttonColor = Colors.red;
        }
                  },
                );
              }, //
            ),
          ],
        ),
      ),
    );
  }

  _onClick() {
    setState(
      () {
        if (switchValue == false) {
          _button = "Flutter1";
          _buttonColor = Colors.blue;
        } else {
          _button = "Flutter2";
          _buttonColor = Colors.red;
        }
      },
    );
  }
}
