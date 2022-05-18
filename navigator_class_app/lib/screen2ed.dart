
import 'package:flutter/material.dart';

class Screen2ed extends StatelessWidget {
  const Screen2ed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 2st"),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          "Screen 2st",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}