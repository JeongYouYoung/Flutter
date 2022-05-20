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
  late List imageName;
  late int ImageNum;
  late List miniImageName;
  late int miniImageNum;
  

  @override
  void initState() {
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    ImageNum = 0;
    miniImageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    miniImageNum = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
      ),
      body: Column(
        children: [
          Text("${imageName[ImageNum]}",
          style:  const TextStyle(
            fontWeight:  FontWeight.bold
          ),),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //많이 쓰게 될꺼야.
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), //모서리 둥글게 만들기
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 10,
                      )),
                  child: Image.asset(
                    "images/${imageName[ImageNum]}",
                    width: 350,
                    height: 600,
                    fit: BoxFit.fill, //정해진 크기대로 꽉맞춰서 그림을 맞춰줌,
                  ),
                ),
              ),
              Positioned(//위치지정//Container를 wrapping함.
                left: 290,
              top: 16,
                child: Container(//Image.asset 를 wrapping함.
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,
                      width: 5,
                    )
                  ),
                  child: Image.asset(
                    "images/${miniImageName[miniImageNum]}",//얘도 나중에 변수값으로 바꿔야함.
                    fit: BoxFit.fill,
                    width: 100,
                    height: 150,
              
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _backpage();
                      _miniBackpage();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  icon: const Icon(Icons.arrow_back_ios_new),
                  label: const Text("이전")),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _nextpage();
                      _miniNextpage();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  icon: const Icon(Icons.arrow_forward_ios),
                  label: const Text("다음")),
            ],
          )
        ],
      ),
    );
  }

//--------------Function-----------------------------------------
  _nextpage() {
    print(ImageNum);
    ImageNum += 1; //얘가 밖으로 나와야 하는구나...
    if (ImageNum >= imageName.length) {
      ImageNum = 0;
    }
  }

  _backpage() {
    ImageNum -= 1;
    if (ImageNum < 0) {
      ImageNum = imageName.length - 1;
    }
  }

   _miniNextpage() {
    print(miniImageNum);
    miniImageNum += 1; //얘가 밖으로 나와야 하는구나...
    if (miniImageNum >= imageName.length) {
      miniImageNum = 0;
    }
  }

_miniBackpage() {
    miniImageNum -= 1;
    if (miniImageNum < 0) {
      miniImageNum = imageName.length -1;
    }
  }

  //삼항연산자사용
  // ImageNum < imageName.length - 1 ? ImageNum + 1 : 0
  //                     // ImageNum < imageName.length - 1 이면 ImageNum + 1 해라 아니면 0 해라
  //                     'images/${imageName[ImageNum < imageName.length - 1 ? ImageNum + 1 : 0]}',
}//end