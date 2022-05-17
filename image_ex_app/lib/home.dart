import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Image Padding"),
      ),
      body: Center( //weiget > SingleChildScrollView <- 스크롤하는 기능
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                "images/pikachu-1.jpg",
                width: 150,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                "images/pikachu-2.jpg",
                width: 150,
                height: 150,
              ),
            ),Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                "images/pikachu-3.jpg",
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
