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

class _HomeState extends State<Home> {
  //Property
  //텍스트를 관리하는 컨트롤러 (클래스)
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //scaffold 를 위젯으로 감싼다음. GestureDetector를 넣어줌 이게 커서깜밖이는거 없애는거.
    return GestureDetector(onTap: (){
      FocusScope.of(context).unfocus();
    },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Single Textfiled"),
        ),
        body: Padding(
          //패딩은 가장 마지막에
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //키보드 안올라오면 cmd+k
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(labelText: '글자를 입력하세요'),
                //keyboardType: TextInputType.number,//숫자 입력
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  //눌렀을때 사용자의 입력 내용 확인 내용이 없으면
                  //trim() 꼭쓰기 스페이스바 구분하기.
                  if (textEditingController.text.trim().isEmpty) {
                    errorSnacKBar(context);
                  } else {
                    showSnackBar(context);
                  }
                },
                child: const Text('출력'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //-------Function
  // Desc : 정상적으로 입력한 글자 보여주기
  showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('입력한 글자는 ${textEditingController.text} 입니다'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }

  // Desc : 텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnacKBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('글자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }


}//end
