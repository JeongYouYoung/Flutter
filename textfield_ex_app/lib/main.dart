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
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late int sum;
  late int result;
  late int sub;

  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    sum = 0;
    result = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      FocusScope.of(context).unfocus();
    },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 덧셈 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
                          TextField(
                controller: textEditingController1,
                decoration: const InputDecoration(
                  labelText: "첫번째 숫자를 입력하세요",
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: textEditingController2,
                decoration: const InputDecoration(
                  labelText: "두번째 숫자를 입력하세요",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                onPressed: () {
                  if (textEditingController1.text.trim().isEmpty) {
                    errorSnacKBar1(context);
                  } else if (textEditingController2.text.trim().isEmpty) {
                    errorSnacKBar2(context);
                  } else {
                    setState(() {
                        sumnum(context);
                        showSnackBar(context);
                      },
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                ),
                icon: const Icon(
                  Icons.add,
                ),
                label: const Text("더하기"),
              ),
              const SizedBox(
                width: 30,
              ),
                ElevatedButton.icon(
                onPressed: () {
                  if (textEditingController1.text.trim().isEmpty) {
                    errorSnacKBar1(context);
                  } else if (textEditingController2.text.trim().isEmpty) {
                    errorSnacKBar2(context);
                  } else {
                    setState(() {
                       subnum(context);
                      },
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                ),
                icon: const Icon(
                  Icons.remove,
                ),
                label: const Text("빼기"),
              )
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
  //-------Function----------------------------------------------

// Desc : 텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnacKBar1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('첫번째 숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnacKBar2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('두번째 숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  sumnum(BuildContext context) {
    sum = (int.parse(textEditingController1.text) + int.parse(textEditingController2.text));
  }

// Desc : 정상적으로 입력한 글자 보여주기
  showSnackBar(BuildContext context) {
    result = int.parse(textEditingController1.text) + int.parse(textEditingController2.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('덧셈 결과는 $result 입니다'),
        duration: const Duration(seconds: 10),
        backgroundColor: Colors.blue,
        
      ),
      
    );
  }
  
  subnum(BuildContext context) {
    sub = (int.parse(textEditingController1.text) - int.parse(textEditingController2.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('뺄셈 결과는 $sub 입니다'),
        duration: const Duration(seconds: 10),
        backgroundColor: Colors.pink,
        
      ),
      
    );
  }

}//End