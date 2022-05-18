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

// 관리하는건 이것만 신경 쓰면됨.

//Property <-  바뀌는 변수
//3.0으로 오면서 변수에 값을 줘야함.
//?나 late를 사용
class _HomeState extends State<Home> {
  late String _buttonState;
  late String  _buttonname;
  late Color _buttonColor; //컬러 속성이 있음.

  @override
  void initState() {
    _buttonState = 'OFF';
    _buttonname = "버튼을 누르세요";
    _buttonColor = Colors.red;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                 _onClick();
              },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor)
              )
              ,
              child: Text(_buttonname),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("버튼상태 : $_buttonState")
          ],
        ),
      ),
    );
  }

//---------------
  _onClick() {
    setState(() {
      if (_buttonState == "OFF") {
        _buttonState = "ON";
        _buttonname = "끄셈";
        _buttonColor = Colors.red;
      } else {
        _buttonState = "OFF";
        _buttonname = "버튼을 누르세요";
         _buttonColor = Colors.green;
      }
    });
    //_buttonState = "ON";
    //consol 에서 확인하기용 내부적변수는 바뀜.
    // 화면에선 안보임. 빌드와 의사소통이 안되는중
    print(_buttonState);
  }
}//
