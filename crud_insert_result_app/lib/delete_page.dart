import 'dart:convert';

import 'package:crud_insert_result_app/message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
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

    codeController.text = Messgae.studentCode;
    nameController.text = Messgae.studentName;
    deptController.text = Messgae.studentDept;
    phoneController.text = Messgae.studentPhone;

    result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//Appbar
      appBar: AppBar(
        title: const Text("Delete for CRUD"),
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
                decoration: const InputDecoration(labelText: "학번 입니다"),
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
//성명 TextField
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "성명 입니다"),
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
//전공 TextField
              TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: "전공 입니다"),
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
//전화번호 TextField
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "전화번호 입니다."),
                keyboardType: TextInputType.number,
                readOnly: true,
              ),
//
              const SizedBox(
                height: 30,
              ),
//ElevatedButton
              ElevatedButton(
                onPressed: () {
                  code = codeController.text;
                  //Button Action
                  deleteAction ();
                },
                child: const Text("삭제"),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Function
  //jsp문제 있나 없나 확인후 연결해주기
  deleteAction() async {
    var url = Uri.parse(
        "http://localhost:8080/Flutter/student_delete_return_flutter.jsp?code=$code");

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
            title: const Text("삭제결과"),
            content: const Text("삭제가 완료되었습니다."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
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