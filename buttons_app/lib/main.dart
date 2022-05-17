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

  // 그림 그리는건 그림으로 넘기고 액션 넘기는건 함수로 넘기는게 편함.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //---------------------------------------------------------TextButton
            TextButton(
              onPressed: () {
                //action은 함수로 넘기기
                // 확인용 출력
                print("Text Button"); // dart
              },
              onLongPress: () {
                //action은 함수로 넘기기
                print("long pressed text button");
              },
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text(
                "Text Button",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            //---------------------------------------------------------ElevatedButton
            ElevatedButton(
              onPressed: () {
                //action은 함수로 넘기기
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  // 끝에 뭉툭한 모서리 만들때.
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Elevated Button"),
            ),
            //---------------------------------------------------------OutlinedButton
            OutlinedButton(
              onPressed: () {
                //action은 함수로 넘기기
              },
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                side: const BorderSide(color: Colors.black87, width: 2.0),
              ),
              child: const Text("OutlinedButton"),
            ),
            //---------------------------------------------------------TextButton.icon
            TextButton.icon(
              onPressed: () {
                //action은 함수로 넘기기
              },
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              label: const Text("Go to home"),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            //---------------------------------------------------------ElevatedButton.icon
            ElevatedButton.icon(
              onPressed: () {
                //action은 함수로 넘기기
              },
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              label: const Text("Go to home"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                //글씨 크기에 따라 버튼 사이즈가 바뀌니까 최소사이즈를 정해주자
                minimumSize: const Size(200, 40),
              ),
            ),
            //---------------------------------------------------------OutlinedButton.icon
            OutlinedButton.icon(
              onPressed: () {
                //action은 함수로 넘기기
              },
              icon: const Icon(
                Icons.home,
                color: Colors.red,
                size: 30,
              ),
              label: const Text("Go to home"),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //---------------------------------------------------------TextButton
                TextButton(
                  onPressed: () {
                    //함수로 들어옴, 확인용 출력
                  },
                  onLongPress: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: const Text(
                    "Text Button",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                //---------------------------------------------------------ElevatedButton
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size(150, 40),
                    shape: RoundedRectangleBorder(
                      // 끝에 뭉툭한 모서리 만들때.
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("Elevated Button"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
