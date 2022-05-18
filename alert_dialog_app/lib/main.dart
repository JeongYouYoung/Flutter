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
        title: const Text("Alert Dialog with Gesture"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text("Hello World"),
        ),
      ),
    );
  }

//-------Function
  _showDialog(BuildContext context) {
    //복원할때 어떻게 할꺼야.
    showDialog(
      context: context,
      //user must tap button!
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text("Alert Title"),
          //내용 -> content:
          content: const Text("Hello World를 \nTouch 했습니다."),
          //Button
          actions: [
            TextButton(
              onPressed: () {
                //종료 되면 전에있던 showDialog에 있는 context로 권한이 넘어간다.
                Navigator.of(ctx).pop();
              },
              child: const Text('종료'),
            )
          ],
        );
      },
    );
  } //End

}
