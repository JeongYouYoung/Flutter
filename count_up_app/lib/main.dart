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
        primarySwatch: Colors.blue,
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
//-----
  late int count;

  @override //초기상태 주기
  void initState() {
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("현재 클릭수는 $count 입니다."),
            const SizedBox(
              height: 50,
            ),
            //바디안에 들어가는 플로팅액션버튼은 화면 스크롤하면 같이 움직임.
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      //진짜 플로팅액션버튼 구석에 있는애.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              count++;
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
