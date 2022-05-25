import 'package:flutter/material.dart';
import 'package:listview_ex_app/flag_list.dart';
import 'package:listview_ex_app/messge.dart';

class SecondPage extends StatefulWidget {
  final List<Flag> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
//Property
  List<Flag> flagList = [];
  final quizController = TextEditingController();
  final flagNameController = TextEditingController();
  var _imagePath;
  String imageName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: quizController,
            keyboardType: TextInputType.text,
            maxLines: 1,
            decoration: const InputDecoration(labelText: "문제를 입력하세요"),
          ),
          TextField(
            controller: flagNameController,
            keyboardType: TextInputType.text,
            maxLines: 1,
            decoration: const InputDecoration(labelText: "정답을 입력하세요"),
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/korea.png";
                    setState(() {
                      imageName = "대한민국";
                    });
                  },
                  child: Image.asset(
                    "images/korea.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/usa.png";
                    setState(() {
                      imageName = "미국";
                    });
                  },
                  child: Image.asset(
                    "images/usa.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/china.png";
                    setState(() {
                      imageName = "중국";
                    });
                  },
                  child: Image.asset(
                    "images/china.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/austria.png";
                    setState(() {
                      imageName = "오스트리아";
                    });
                  },
                  child: Image.asset(
                    "images/austria.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/belgium.png";
                    setState(() {
                      imageName = "벨기에";
                    });
                  },
                  child: Image.asset(
                    "images/belgium.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/france.png";
                    setState(() {
                      imageName = "프랑스";
                    });
                  },
                  child: Image.asset(
                    "images/france.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/germany.png";
                    setState(() {
                      imageName = "독일";
                    });
                  },
                  child: Image.asset(
                    "images/germany.png",
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/italy.png";
                    setState(() {
                      imageName = "이탈리아";
                    });
                  },
                  child: Image.asset(
                    "images/italy.png",
                    width: 80,
                  ),
                ),
              ],
            ),
          ),
          Text(imageName),
          ElevatedButton(
              onPressed: () {
                if (quizController.text.trim().isEmpty &&
                    flagNameController.text.trim().isEmpty) {
                  alertAdd(context);
                } else {}
              },
              child: const Text("문제 추가하기"))
        ],
      ),
    );
  }

  
  alertAdd(BuildContext context) {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
      title: Text("문제 추가하기"),
      content: Text("이국가의 문제는 ${quizController.text}입니다."
          "또 이 문제의 정답은 ${flagNameController.text}입니다."
          "이 문제를 추가하시겠습니까?"),
      actions: [
        TextButton(
            onPressed: () {
              addFlag();
              Navigator.of(context).pop();
            },
            child: const Text("예")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("아니오"))
      ],
    );
      }
      );
  }

  addFlag() {
    // list를 불러오긴했지만 다른 클래스이므로 widget.을 붙여서 클래스를 불러와줘야함.
    widget.list.add(Flag(
        imageFlag: imageName,
        flagName: flagNameController.text,
        quizName: quizController.text));
  }
}//end
