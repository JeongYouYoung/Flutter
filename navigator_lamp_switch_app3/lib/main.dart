import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app3/controller.dart';

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
  late bool lampStatus;
  late bool lampColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampImage = "images/lamp_on.png";
    lampStatus = true;
    lampColor = true;
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
                //값을 불러와야하니까 컨트롤러에 찾아서 넣어줘야함
                return Controller(lampColor: lampColor, lampStatus: lampStatus);
                //value로 되어있지만 이 안에 List가 들어있음.
              })).then((value) => getData(value)); //내가 부른놈 위치로 온다
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

  getData(value) {
    print("Controller : ${value[0]},${value[1]}");

    //   //Message상태 확인하는 함수
    setState(() {
      if (value[0]) {
        if (value[1]) {
          _lampImage = "images/lamp_on.png";
          lampColor = true;
        } else {
          _lampImage = "images/lamp_red.png";
          lampColor = false;
        }
        lampStatus = true;
      }else {
        _lampImage = "images/lamp_off.png";
        lampStatus = false;
        //
        if(value[1]){
          lampColor = true;
        }else{
          lampColor = false;
        }
      }
    });
  }
}//end
