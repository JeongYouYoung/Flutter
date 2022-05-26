import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  //------------- ** Property ** ------------//
  //몇개를 받아올지 모르니까 List로 선언먼저
  late List data;

//------------- ** initState ** ------------//
  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON Movie"),
      ),
      body: Center(
        child: data.isEmpty
            ? const Text("데이터가 없쉉")
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Card(
                              color: Colors.lightGreen[100],
                              child: Column(
                                children: [
                                  Image.network(
                                    data[index]['image'],
                                    height: 150,
                                    width: 100,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    color: Colors.lightGreenAccent[100],
                                    height: 30,
                                    width: 100,
                                    child: Text(
                                      data[index]['title'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
      ),
    );
  }

  //-------------------  ** Function **  ---------------------//
  Future<bool> getJSONData() async {
    //비동기 함수 == 작업하면서 화면구성도 같이하겠다!
    //이럴땐 (주소) var를 많이 씀.
    //http 가 위주소를 다가져옴 //await <- 빌드가 끝날때까지 일단 기다려
    var url = Uri.parse("https://zeushahn.github.io/Test/movies.json");
    var response = await http.get(url);

    //----- 내가 알아보기 쉽게 변형해주기! -----//
    setState(() {
      //화면 구성이 바뀌니까 setState 사용!
      //body는 통째로 보여줘
      //한글해주는건 utf8.decode(response.bodyBytes)로 해야함!
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results']; //results 키값!
      data.addAll(result);
      print(result);
    });

    print(response.body);

    return true;
  }
}//End