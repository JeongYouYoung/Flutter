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
            onPressed: (){
              if(quizController.text.trim().isEmpty && flagNameController.text.trim().isEmpty){
                addList();
                
              }else{
                Navigator.pop(context);
              }
            }, 
          child: const Text("문제 추가하기"))
        ],
      ),
    );
  }

addList(){
Message.imageFlag = imageName;
Message.quizName = quizController.text;
Message.flagName = flagNameController.text;
}

alertAdd(BuildContext context, position){
showDialog(context: context, 
builder: (BuildContext ctx){
  return AlertDialog(
    title: Text("문제 추가하기"),
    content: Text(
      "이 국기에 문제는 ${widget.list[position].quizName} 입니다."
      "또 이 문제의 정답은 ${widget.list[position].flagName}"
    ),
  );
});

}
}//end
