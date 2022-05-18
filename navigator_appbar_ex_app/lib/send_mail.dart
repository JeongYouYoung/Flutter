
import 'package:flutter/material.dart';

class send extends StatelessWidget {
  const send({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Mail"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: const [
          SizedBox(
              height: 50,),
          Text("유비에게 보낸 메일"),
          Text("관우에게 보낸 메일"),
          Text("장비에게 보낸 메일"),
        ],
      ),
    );
  }
}