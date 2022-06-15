import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IrisPage extends StatefulWidget {
  const IrisPage({Key? key}) : super(key: key);

  @override
  State<IrisPage> createState() => _IrisPageState();
}

class _IrisPageState extends State<IrisPage> {
  late TextEditingController sl;
  late TextEditingController sw;
  late TextEditingController pl;
  late TextEditingController pw;
  late String irisImage;
  late String irisName;
  late String sepalLength;
  late String sepalWidth;
  late String petalLength;
  late String petalWidth;

  @override
  void initState() {
    super.initState();
    sl = TextEditingController();
    sw = TextEditingController();
    pl = TextEditingController();
    pw = TextEditingController();
    irisName = "all";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iris 품종 예측"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: sl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text(
                    "Sepal Length의 크기를 입력하세요",
                  ),
                ),
              ),
              TextField(
                controller: sw,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text(
                    "Sepal Width의 크기를 입력하세요",
                  ),
                ),
              ),
              TextField(
                controller: pl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text(
                    "Petal Length의 크기를 입력하세요",
                  ),
                ),
              ),
              TextField(
                controller: pw,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text(
                    "Petal Width의 크기를 입력하세요",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: ElevatedButton(
                    onPressed: () {
                      sepalLength = sl.text;
                      sepalWidth = sw.text;
                      petalLength = pl.text;
                      petalWidth = pw.text;

                      getJSONData();
                    },
                    child: const Text("입력")),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("images/$irisName.jpg"),
                radius: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getJSONData() async {
    var url = Uri.parse(
        "http://localhost:8080/Rserve/response_iris.jsp?sepalLength=$sepalLength&sepalWidth=$sepalWidth&petalLength=$petalLength&petalWidth=$petalWidth");

    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      String result = dataConvertedJSON['result'];
      irisName = result;
      print(irisName);
      _showDialog(context);
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text("품종 예측 결과"),
          content: Text("입력하신 품종은 $irisName 입니다."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"))
          ],
        );
      },
    );
  }
}//End
