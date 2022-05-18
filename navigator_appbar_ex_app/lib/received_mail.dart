import 'package:flutter/material.dart';

class received extends StatelessWidget {
  const received({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Received Mail"),
        backgroundColor: Colors.deepOrange,
      ),
       body: Column(
        children: const [
          SizedBox(
              height: 50,),
          Text("유비에게 온 메일"),
          Text("관우에게 온 메일"),
          Text("장비에게 온 메일"),
        ],
      ),
    );
  }
}