import 'package:flutter/material.dart';
import 'package:listview_ex_app/first_page.dart';
import 'package:listview_ex_app/flag_list.dart';
import 'package:listview_ex_app/second_page.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
with SingleTickerProviderStateMixin{
  late TabController controller;
  List<Flag> flagList= [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    flagList.add(Flag(
      imageFlag: "images/austria.png", flagName: "오스트리아",quizName:"오_____" ));
    flagList.add(Flag(
      imageFlag: "images/belgium.png", flagName: "벨기에",quizName:"벨_____"));
    flagList.add(Flag(
      imageFlag: "images/estonia.png", flagName: "에스토니아",quizName:"에_____"));
    flagList.add(Flag(
      imageFlag: "images/france.png", flagName: "프랑스",quizName:"프_____"));
    flagList.add(Flag(
      imageFlag: "images/germany.png", flagName: "독일",quizName:"독_____"));
    flagList.add(Flag(
      imageFlag: "images/hungary.png", flagName: "헝가리",quizName:"헝_____"));
    flagList.add(Flag(
      imageFlag: "images/italy.png", flagName: "이탈리아",quizName:"이_____"));
    flagList.add(Flag(
      imageFlag: "images/latvia.png", flagName: "라트비아",quizName:"라_____"));
    flagList.add(Flag(
      imageFlag: "images/lithuania.png", flagName: "리투아니아",quizName:"리_____"));
    flagList.add(Flag(
      imageFlag: "images/luxemburg.png", flagName: "룩셈부르크",quizName:"룩_____"));
    flagList.add(Flag(
      imageFlag: "images/netherland.png", flagName: "네덜란드",quizName:"네_____"));
    flagList.add(Flag(
      imageFlag: "images/romania.png", flagName: "루마니아",quizName:"루_____"));

  }

@override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("국가명 맞추기"),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: flagList,),
          SecondPage(list: flagList),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.amberAccent,
        child: TabBar(
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}