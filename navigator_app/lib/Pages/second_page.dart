import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
        backgroundColor: Colors.red,
        elevation: 0, //appbar와 단차? 0으로 만들기
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); //위에 쌓인걸 없애는것
          },
          style: ButtonStyle(
            //이건 전부다 색깔 바꿀수 있어
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text("Go to the first page"),
        ),
      ),
    );
  }
}
