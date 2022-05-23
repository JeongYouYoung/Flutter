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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String lampImage;
  late bool lamp;

  @override
  void initState() {
    // TODO: implement initState
    lampImage = "images/lamp_on.png";
    lamp = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert를 이용한 메세지 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              lampImage,
              width: 200,
              height: 500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          if (lamp == false) {
                            lamp = true;
                            lampAction();
                          } else {
                            alertOn(context);
                          }
                        },
                      );
                    },
                    child: const Text("켜기")),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          if (lamp == false) {
                            alertOff2(context);
                          } else {
                            alertOff(context);
                          }
                        },
                      );
                    },
                    child: const Text("끄기")),
              ],
            )
          ],
        ),
      ),
    );
  }

  lampAction() {
    if (lamp == true) {
      lampImage = "images/lamp_on.png";
    } else {
      lampImage = "images/lamp_off.png";
    }
  }

//----------
  alertOn(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        if (lamp == true) {
          return AlertDialog(
            title: const Text("경고"),
            content: const Text("현재 램프가 켜진 상태입니다."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("네 알겠습니다.")),
            ],
          );
        } else {
          return lampAction();
        }
      },
    );
  }

  alertOff(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        if (lamp == true) {
          return AlertDialog(
            title: const Text("램프 끄기"),
            content: const Text("램프를 끄시겠습니까?"),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      lamp = false;
                      lampAction();
                      Navigator.of(ctx).pop();
                    });
                  },
                  child: const Text("네")),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('아니요'))
            ],
          );
        } else {
          return lampAction();
        }
      },
    );
  }

  alertOff2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        if (lamp == false) {
          return AlertDialog(
            title: const Text("경고"),
            content: const Text("현재 램프가 꺼진 상태입니다."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("네 알겠습니다."))
            ],
          );
        } else {
          return lampAction();
        }
      },
    );
  }
}// end