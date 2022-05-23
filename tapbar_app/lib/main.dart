import 'package:flutter/material.dart';
import 'package:tapbar_app/first_page.dart';
import 'package:tapbar_app/second_page.dart';

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
    with SingleTickerProviderStateMixin {
  //with: 상속한다
  //Property
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); //2 : 내가 쓸탭은 2개야! | this 여기에서 한다.
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    //위젯이 종료될때 사용. 컨트롤러는 계속떠있는 애라서 정리가 필요
    // super전에 써야함.
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //    title: const Text("Tab Bar Test"),
      //  ),
      body: TabBarView(
          //body : appbar와 tapbar사이
          controller: controller,
          children: const [
            //*****--------------------------------------
            FirstPage(), SecondPage() //순서정해주는거 완전 중요!
          ]),
      bottomNavigationBar: Container(
        color: Colors.yellowAccent,
        height: 100,//위!
        child: TabBar(
            controller: controller,
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.red, //현재 어느위치에 있는지 알려주는 막대기
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.looks_one,
                  color: Colors.blue,
                ),
                text: "One",
              ),
              Tab(
                icon: Icon(
                  Icons.looks_two,
                  color: Colors.red,
                ),
                text: "Two",
              ),
            ]),
      ),
    );
  }
}
