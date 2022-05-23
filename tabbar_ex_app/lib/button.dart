import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  late List imageName;
  late int ImageNum;
  

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
    ImageNum = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('이미지 버튼으로 변경하기'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("${imageName[ImageNum]}",
            style:  const TextStyle(
              fontWeight:  FontWeight.bold
            ),),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                //많이 쓰게 될꺼야.
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), //모서리 둥글게 만들기
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 1,
                    )),
                child: Image.asset(
                  "images/${imageName[ImageNum]}",
                  width: 350,
                  height: 500,
                  fit: BoxFit.fill, //정해진 크기대로 꽉맞춰서 그림을 맞춰줌,
                ),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _backpage();
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
                    icon: const Icon(Icons.arrow_back_ios_new),
                    label: const Text("이전")),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _nextpage();
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
                    icon: const Icon(Icons.arrow_forward_ios),
                    label: const Text("다음")),
              ],
            )
          ],
        ),
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
}//end