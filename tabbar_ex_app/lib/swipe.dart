import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  //Propert   빌드에서 다시보여주는애들
  late List imageName;
  late int currentImage; //인덱스값.

  @override
  void initState() {
    imageName = [
      'chun01.jpeg',
      'chun02.jpeg',
      'chun03.jpeg',
      'chun04.jpeg',
      'chun05.jpeg',
      'chun06.jpeg',
      'chun07.jpeg'
    ];
    currentImage = 0; //list 변수값
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(title: const Text("이미지 Swipe 로 변경하기"),
      backgroundColor: Colors.deepPurple,),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //타입이 다이나믹으로 되어있음 내가 정해줘야함.리스트는 ->[]
                imageName[
                    currentImage], //변수를 써야 화면넘어갈때마다 수정안해줘도 됨. 그래서 리스트 쓰는것임.
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
}//end