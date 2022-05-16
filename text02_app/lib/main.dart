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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text with Column and Row"),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: const [
      //           Icon(
      //             Icons.email_rounded,

      //             ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           Text('James')
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: const [
      //           Icon(Icons.account_balance),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           Text('Cathy')
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: const [
      //           Icon(
      //             Icons.account_circle,
      //             color: Colors.blue,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           Text('Kenny')
      //         ],
      //       ),
      //     ],
      //   ),
      // ),

      //전체애 대한 padding는 전체가 떨어지는거니까 지금은 쓸모가 없고
      // 각각 떨어뜨리기 위해서는 각각 padding를 주는게 맞다.
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.email_rounded),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_balance),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('James'),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Cathy'),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Kenny'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
