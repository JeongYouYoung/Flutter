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
  late TextEditingController num1;
  late TextEditingController num2;
  late TextEditingController sum;
  late TextEditingController sub;
  late TextEditingController mul;
  late TextEditingController div;

  @override
  void initState() {
    num1 = TextEditingController();
    num2 = TextEditingController();
    sum = TextEditingController();
    sub = TextEditingController();
    mul = TextEditingController();
    div = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("간단한 계산기"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TextField(
                  controller: num1,
                  decoration: const InputDecoration(labelText: "첫번째 숫자를 입력하세요"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: num2,
                  decoration: const InputDecoration(labelText: "두번째 숫자를 입력하세요"),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
              
                        if (num1.text.trim().isEmpty) {
                        errorSnacKBar1(context);
                      } else if (num2.text.trim().isEmpty) {
                        errorSnacKBar2(context);
                      } else{
                        sum.text = (int.parse(num1.text) + int.parse(num2.text)).toString();
                        sub.text = (int.parse(num1.text) - int.parse(num2.text)).toString();
                        mul.text = (int.parse(num1.text) * int.parse(num2.text)).toString();
                        div.text = (int.parse(num1.text) / int.parse(num2.text)).toString();
                      }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                      ),
                      child: const Text("계산하기"),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        num1.text = "";
                        num2.text = "";
                        sum.text = "";
                        sub.text = "";
                        mul.text = "";
                        div.text = "";
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                      ),
                      child: const Text("지우기"),
                    ),
                  ],
                ),
                TextField(
                  readOnly: true, 
                  controller: sum,
                  decoration : const InputDecoration(
                  labelText : "덧셈의 결과",
                  )
                ),
                TextField(
                  readOnly: true,
                  controller: sub,
                  decoration : const InputDecoration(
                  labelText : "뺄셈의 결과",
                  ),
                  onTap: (){
                    sum;
                  },
                ),
                TextField(
                  readOnly: true,
                  controller: mul,
                  decoration : const InputDecoration(
                  labelText : "곱셈의 결과",
                  
                  )
                ),
                TextField(
                  readOnly: true,
                  controller: div,
                  decoration : const InputDecoration(
                  labelText : "나눗셈의 결과",
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//Function----------------------------------------------------------

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




}//end