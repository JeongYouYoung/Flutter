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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Property : 전역변수 -> 화면에 바뀌는건 다 여기 들가야함.
  //이미지 이름
  late String _lampImage; //Image Name
  late double _lampWidth; //Image Width
  late double _lampHeigth; //Image Heigth
  late String _buttonName; //button Name
  late bool _switch; //switch status
  late String _lampSizeStatus; //image Size Status

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeigth = 300;
    _buttonName = "Image 확대";
    _switch = true;
    _lampSizeStatus = 'small';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image 확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Container(//컨테이너는 유일하게 색을 줄수 있다.
            SizedBox(
              // color: Colors.blueGrey,
              width: 350,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeigth,
                  )
                ],
              ),
              //위,아래 넓이를 줄수 있어서 SizedBox사용 하지만 child 로 사이즈를 주면
              //child는 모든 권한을 다 가지고있어서  children 으로 옮겨줘야함.
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      //이미지 확대축소 함수
                      decisionLampSize();
                    });
                  },
                  child: Text(_buttonName),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text('전구 스위치'),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        setState(() {
                          //전구 껏다켰다 하는 함수
                          _switch = value;
                          decisionOnOff();
                        });
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
// Function---------------------------------------

  decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      _lampWidth = 300;
      _lampHeigth = 600;
      _buttonName = "Image 축소";
      _lampSizeStatus = "large";
    } else {
      _lampWidth = 150;
      _lampHeigth = 300;
      _buttonName = "Image 확대";
      _lampSizeStatus = "small";
    }
  }

  decisionOnOff() {
    //value는 위에함수안에서만 아니까 전역변수인 _switch를 만들어준거임.
    if (_switch) {
      _lampImage = "images/lamp_on.png";
    } else {
      _lampImage = "images/lamp_off.png";
    }
  }
} //end
