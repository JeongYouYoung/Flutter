import 'package:flutter/material.dart';
import 'package:tabbar_ex_app/button.dart';
import 'package:tabbar_ex_app/swipe.dart';

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

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }


@override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("이미지 변경하기"),
      // ),
    body: TabBarView(
      controller: tabController,
      children: const [
        ButtonPage(),SwipePage()
      ],
      ),
      bottomNavigationBar: Container(
        color: Colors.deepPurple[200],
        child: TabBar(
          controller: tabController,
          labelColor: Colors.deepPurple,
          indicatorColor: Colors.grey,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.card_giftcard,
                color: Colors.black,
              ),
            ),
             Tab(
              icon: Icon(
                Icons.card_membership,
                color: Colors.black,
              ),
            )
          ]), 
        )
      ,
    );
  }
}