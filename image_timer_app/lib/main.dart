import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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
  //Propert   빌드에서 다시보여주는애들
  late List imageName;
  late int currentImage; //인덱스값.

  @override
  void initState() {
    imageName = [
      "chun01.jpeg",
      "chun02.jpeg",
      "chun03.jpeg",
      "chun04.jpeg",
      "chun05.jpeg",
      "chun06.jpeg",
    ];
    currentImage = 0; //list 변수값
    super.initState();

    //Timer 설치-----------
    //initState에서  Timer치고 엔터
    Timer.periodic(const Duration(seconds:1), (Timer timer) {
      changImage();
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(title: const Text("3초 마다 이미지 무한 반복")),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //타입이 다이나믹으로 되어있음 내가 정해줘야함.리스트는 ->[]
                imageName[currentImage], //변수를 써야 화면넘어갈때마다 수정안해줘도 됨. 그래서 리스트 쓰는것임.
              ),
              Image.asset(
                'images/${imageName[currentImage]}',
                width: 350,
                height: 600,
              )
            ],
          ),
        ),
      ),
    );
  }

// Image Swipe Function---------------------------------------------
  _onHorizontalSwipe(SwipeDirection direction) {
    //diraction에 방향이 들어있음
    setState(() {
      if (direction == SwipeDirection.left) {
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }

  _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.down) {
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }

  changImage(){
  currentImage ++;
  if(currentImage >= imageName.length){
    currentImage = 0;
  }

  }
}//end
