import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  //Propert
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;
 
  /*url에 결과값을 넣으려니까 너무 기니까 이름 줄여주자 */
  late String code;
  late String name;
  late String dept;
  late String phone;
  
  late String result;

//initState
  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

    result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//Appbar
      appBar: AppBar(
        title: const Text("Insert & retrun for CRUD"),
      ),

//Body
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
//학번 TextField
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: "학번을 입력하세요"),
                keyboardType: TextInputType.text,
              ),
//성명 TextField
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "성명을 입력하세요"),
                keyboardType: TextInputType.text,
              ),
//전공 TextField
              TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: "전공을 입력하세요"),
                keyboardType: TextInputType.text,
              ),
//전화번호 TextField
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "전화번호를 입력하세요"),
                keyboardType: TextInputType.number,
              ),
//
              const SizedBox(
                height: 30,
              ),
//ElevatedButton
              ElevatedButton(
                onPressed: () {
                  code = codeController.text;
                  name = nameController.text;
                  dept = deptController.text;
                  phone = phoneController.text;

                  //Button Action
                  insertAction ();
                },
                child: const Text("입력"),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Function
  //jsp문제 있나 없나 확인후 연결해주기
  insertAction() async {
    var url = Uri.parse(
        "http://localhost:8080/Flutter/student_insert_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone");

    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    
    /*Flutter 3.0되면서 조금 바뀌어서 setState안에 넣어줬더니 파란줄이 없어짐!*/
      if (result == "OK") {
        _showDialog(context);
      } else {
        errorSnackBar(context);
      }
    });
  }

//Alert Function
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text("입력결과"),
            content: const Text("입력이 완료되었습니다."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(ctx).pop();
                    
                    
                  },
                  child: const Text("OK"))
            ],
          );
        });

  }

//SnackBar Function
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("사용자 정보 입력에 잘못되었습니다."),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}