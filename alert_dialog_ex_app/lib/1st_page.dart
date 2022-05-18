import 'package:flutter/material.dart';

import '2ed_page.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Alert and push"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _show(context),
          child: const Text('Move the 2ed page'),
        ),
      ),
    );
  }

// Function
  _show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text("Page 이동"),
          content: const Text("아래의 버튼을 누르면 페이지 이동을 합니다."),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(ctx, '/page2');
                },
                child: const Text('Page 이동'),),
          ],
        );
      },
    );
  }
  


}