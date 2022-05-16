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
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text01_app"
        ),
       centerTitle: false,
       backgroundColor: Colors.blueGrey, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //padding 중요한 단어!
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "James",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20
                    ),
                  ),
                  SizedBox(
                   width: 20,
                  ),
                  Text(
                    "Cathy",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20
                    ),
                  ),
                   SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Kenny",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "James",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20
                    ),
                  ),
                  SizedBox(
                   width: 20,
                  ),
                  Text(
                    "Cathy",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20
                    ),
                  ),
                   SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Kenny",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
