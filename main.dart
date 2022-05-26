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
        primarySwatch: Colors.green,
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
  late TextEditingController id;
  late TextEditingController pw;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = TextEditingController();
    pw = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 50),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/chun04.jpeg"),
                radius: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: id,
                decoration: const InputDecoration(labelText: "아이디를 입력하세요"),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pw,
                decoration: const InputDecoration(labelText: "비밀번호를 입력하세요"),
                keyboardType: TextInputType.text,
                obscureText: true, //텍스트 가져주는 기능
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    //스낵바 추가
                    if (id.text.trim().isEmpty) {
                      IdNullerorrSnackBar(context);
                    }else if(id.text != "root"){
                      IderorrSnackBar(context);
                    }else if(pw.text.trim().isEmpty){
                      PwNullerorrSnackBar(context);
                    }else if(pw.text != "qwer1234"){
                      PwerorrSnackBar(context);
                    }else{
                      WelcomAlert(context);
                    }
                  },
                  child: const Text("Log In")),
            )
          ],
        ),
      ),
    );
  }

  IdNullerorrSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("아이디를 입력해주세요."),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  }
  IderorrSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("아이디가 일치하지 않습니다. 다시 입력해주세요"),
      duration: Duration(seconds: 1),
       backgroundColor: Colors.red,
    ));
  }
  PwNullerorrSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("비밀번호를 입력해주세요."),
      duration: Duration(seconds: 1),
       backgroundColor: Colors.red,
    ));
  }
  PwerorrSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("비밀번호가 일치하지 않습니다. 다시 입력해주세요."),
      duration: Duration(seconds: 1),
       backgroundColor: Colors.red,
    ));
  }

WelcomAlert(BuildContext context){
  showDialog(context: context, 
  builder: (BuildContext ctx){
    return AlertDialog(
      title: const Text("환영 합니다!"),
      content: const Text("신분이 확인 되었습니다."),
      actions: [
        ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: const Text("OK")
          )
      ],
    );
  });
}






}//end
