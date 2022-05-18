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
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text("영웅 Card"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/Lee.jpg"),
                  radius: 80,
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
              child: Text(
                "성웅",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
              child: Text(
                "이순신 장군",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
              child: Text(
                "전적",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "62전 62승",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Column(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.check_circle_outline),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "옥포해전",
                          style: TextStyle(fontSize: 19),
                        ),
                        Text(
                          "사천포해전",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "당포해전",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "한산도대첩",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "부산포해전",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "명량해전",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "노량해전",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Image.asset(
                "images/turtle.gif",
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
