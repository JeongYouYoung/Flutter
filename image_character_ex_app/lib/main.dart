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
          children:[
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
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                "성웅",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                "이순신 장군",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                "전적",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
             const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                "62전 62승",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.check_circle_rounded),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.check_circle_rounded),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.check_circle_rounded),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.check_circle_rounded),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.check_circle_rounded),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.check_circle_rounded),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.check_circle_rounded),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("옥포해전"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("사천포해전"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("당포해전"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("한산도대첩"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("부산포해전"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("명량해전"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("노량해전"),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
