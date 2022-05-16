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
      //우측상단의 debug바를 없애겠다
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //디자인담당
    return Scaffold(
      backgroundColor: Colors.purple[50],
      //제목 (appbar 만들어놓고 실행시킨후 cmd+s 로 확인하면서 코딩 들어간다.)
      appBar: AppBar(
        //const 패턴의 소스에 이게 없으면 옜날것.
        //text 쓰는 '대한민국'은 안바뀔꺼야 그래서 랜더링 안할꺼야 라는 뜻
        title: const Text(
          '대한민국',
        ),
        //색깔 바꾸는거 모를땐 Colors만 쳐봐
        backgroundColor: Colors.amberAccent, //
        foregroundColor: Colors.black, //글자색
      ),

      // 돋보기모양 Widget Inpector로 확인하는거 중요
      // Text라는 위젯은 전부다 포함하고 있어서 추가가 안됨.
      // Center위젯 안에 사용하면 여러개 사용가능
      // cmd +a  cmd+k+f <- 정렬해주는 단축키
      //alt + sft + 밑에화살표 <- 줄복사
      // column()
      // - y축 방향
      // Row()
      // - x축 방향

      //딕셔너리는 {k:v}로 구성
      body: Center(//body는 기본적으로 Center먼저 사용
      
          child: Column(
            // 컬럼 안쓰고 text만 쓴상태에서 column불러올때는 옆에 전구모양으로 불러올수 있음
            // 컬럼은 밑으로 쌓이는것 y축
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            Text(
              "유비",
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "관우",
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "장비"
            )
          ],
        )
      ),
    );
  }
}
