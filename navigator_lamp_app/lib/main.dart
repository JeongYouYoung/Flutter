import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/message.dart';
import 'package:navigator_lamp_app/modify_page.dart';

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
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textEditingController;

  late String lampImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    lampImage = "images/lamp_on.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main 화면"),
        leading: IconButton(
            onPressed: () {
              //일단은 그냥 있는 버튼
            },
            icon: const Icon(Icons.home)),
        actions: [
          IconButton(
              onPressed: () {
                Message.text = textEditingController.text;
                Navigator.push(
                  context, MaterialPageRoute(builder: ((context){
                    return ModifyPage();
                  }))).then((value) => getData());
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("글자를 입력하세요"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                lampImage,
                width: 200,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }

  getData() {
    textEditingController.text = Message.text;
    setState(() {
      if(Message.lamp == true){
        lampImage = "images/lame_on.png";
      }else{
        lampImage = "images/lamp_off.png";
      }
    });
  }
}//end