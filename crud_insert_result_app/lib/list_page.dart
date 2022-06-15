import 'dart:convert';

import 'package:crud_insert_result_app/message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
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
//---------------- ** AppBar ** ---------------//
      appBar: AppBar(
        title: const Text("JSON Test"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/insert').then((value) => getJSONData());
              },
              icon: const Icon(Icons.add))
        ],
      ),

//------------------ ** Body ** -----------------//
//      List인뎅 왜 Center 쓰느냣 <- ios는 인디케이터값이 무조건 가운데에 있지만
//                                안드로이드는 기본이 Center가 아님 그래서 Center안에 써줘야함
      body: Center(
//    data라는 리스트가 없으면 텍스트 띄워주고 아니면 ListView.builder 로 화면구성(삼항연산자 사용)
        child: data.isEmpty
            ? const Text("데이터가 없습니다.")
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: GestureDetector(
                          onTap: () {
                            //Card 클릭 제스쳐
                            //가져가야할것. code,name,dept,phone
                            Messgae.studentCode = data[index]['code'];
                            Messgae.studentName = data[index]['name'];
                            Messgae.studentDept = data[index]['dept'];
                            Messgae.studentPhone = data[index]['phone'];
                            Navigator.pushNamed(context, '/update').then((value) => getJSONData());
                          },
                          onLongPress: (){
                            Messgae.studentCode = data[index]['code'];
                            Messgae.studentName = data[index]['name'];
                            Messgae.studentDept = data[index]['dept'];
                            Messgae.studentPhone = data[index]['phone'];
                            Navigator.pushNamed(context, '/delete').then((value) => getJSONData());
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Code :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index]['code'],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Name :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index]['name'],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Dept :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index]['dept'],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Phone :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index]['phone'],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }

//-------------------  ** Function **  ---------------------//
  Future<bool> getJSONData() async {
    //비동기 함수 == 작업하면서 화면구성도 같이하겠다!
    //이럴땐 (주소) var를 많이 씀.
    data.clear();
    var url =
        Uri.parse("http://localhost:8080/Flutter/student_query_flutter.jsp");
    //http 가 위주소를 다가져옴 //await <- 빌드가 끝날때까지 일단 기다려
    var response = await http.get(url);

    /* 내가 알아보기 쉽게 변형해주기! */
    setState(() {
      //화면 구성이 바뀌니까 setState 사용!
      //body는 통째로 보여줘
      //한글해주는건 utf8.decode(response.bodyBytes)로 해야함!
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results']; //results 키값!

      //print(result);
      //result[0]['code'] = S001 <- 리스트에 넣어준거 불러오는법

      //불러오고 수정한값을 이제 넣어주자!
      data.addAll(result);
     //print(data[0]['code']); //flutter: S001
    });

    //print(response.body);
    return true;
  }

  getData(){

}
//   pushUpdarePage(BuildContext context, index){
//     Messgae.studentCode = data[index]['code'];
//     Messgae.studentName = data[index]['name'];
//     Messgae.studentDept = data[index]['dept'];
//     Messgae.studentPhone = data[index]['phone'];
//     Navigator.
//   }


}//END