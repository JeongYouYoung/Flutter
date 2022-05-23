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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//Propert
  late bool lampOnOff;
  late bool lampZoom;
  late String lampImage;
  late double lampW;
  late double lampH;
  late String lampZoomText;

  @override
  void initState() {
    // TODO: implement initState
    lampOnOff = true;
    lampZoom = false;
    lampImage = 'images/lamp_on.png';
    lampW = 150;
    lampH = 300;
    lampZoomText = "확대";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image확대 및 축소"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  lampImage,
                  width: lampW,
                  height: lampH,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(lampZoomText),
              const SizedBox(
                width: 50,
              ),
              const Text('전구 스위치')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                  value: lampZoom,
                  onChanged: (value) {
                    setState(() {
                      lampZoom = value;
                      decisionLampSize();
                    });
                  }),
              const SizedBox(
                width: 40,
              ),
              Switch(
                value: lampOnOff,
                onChanged: (value) {
                  setState(() {
                    lampOnOff = value;
                    decisionOnOff();
                  });
                },
              )
            ],
          )
        ],
      )),
    );
  }
//function

  decisionLampSize() {
    if (lampZoom == true) {
      lampW = 300;
      lampH = 600;
      lampZoomText = "축소";
    } else {
      lampW = 150;
      lampH = 300;
      lampZoomText = "확대";
    }
  }

  decisionOnOff() {
    //value는 위에함수안에서만 아니까 전역변수인 _switch를 만들어준거임.
    if (lampOnOff == false) {
      lampImage = "images/lamp_off.png";
    } else {
      lampImage = "images/lamp_on.png";
    }
  }
}//end