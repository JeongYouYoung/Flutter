import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

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
        title: const Text("Snack Bar"),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body: const MySnackBar(),// class 불러올때 사용하는 body
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           // ScaffoldMessenger.of(context).showSnackBar(
      //           //   const SnackBar(
      //           //     content: Text("ElevatedButton"),
      //           //     duration: Duration(seconds: 1),
      //           //     backgroundColor: Colors.blue,
      //           //   ),
      //           // );
      //           // //--------------------------Function
      //           // //단 context 값을 가져와야함.
      //           snackBarFunction2(context);
      //         },
      //         child: const Text("Snackbar Button"),
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           // ScaffoldMessenger.of(context).showSnackBar(
      //           //   const SnackBar(
      //           //     content: Text("ElevatedButton"),
      //           //     duration: Duration(seconds: 1),
      //           //     backgroundColor: Colors.red,
      //           //   ),
      //           // );
      //           // //--------------------------Function
      //           // //단 context 값을 가져와야함.
      //           snackBarFunction(context);
      //         },
      //         style: ElevatedButton.styleFrom(
      //           primary: Colors.red,
      //         ),
      //         child: const Text("Snackbar Button"),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

//-------Function
//BuildContext : 나는 컨테스트 값을 받아야한다.
  snackBarFunction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("ElevatedButton"),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  snackBarFunction2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("ElevatedButton"),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.blue,
      ),
    );
  }
}//end
//코드,함수,클래스 만들어 쓰는법