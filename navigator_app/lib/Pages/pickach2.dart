import 'package:flutter/material.dart';
import 'package:navigator_app/Pages/first_page.dart';

class pikachu2 extends StatelessWidget {
  const pikachu2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pickachu2"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("images/pikachu-2.jpg"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FirstPage();
                    },
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
              ),
              child: const Text(
                "Go to the pickachu1 page",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
