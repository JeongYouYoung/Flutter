import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  final bool lampColor;
  final bool lampStatus;
  const Controller({Key? key, required this.lampColor, required this.lampStatus}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  // 화면이 바뀌는 값 선언
  late String switchLabel;
  late String switchColorLabel;
  // 스위치에 바뀌는 값이 들어가야하는 값
  late bool switchValue;
  late bool switchColor;

  //여러변수를 한번에 보내기위해 선언!
  List status = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // if문이 들어옴!
    //컬러값!
    if (widget.lampColor == true) {
      switchColorLabel = "Yellow";
      switchColor = true;
    } else {
      switchColorLabel = "red";
      switchColor = false;
    }
    // On,Off 값!
    if (widget.lampStatus == true) {
      switchLabel = "On";
      switchValue = true;
    } else {
      switchLabel = "Off";
      switchValue = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("수정화면"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchColorLabel),
                Switch(
                    value: switchColor,
                    onChanged: (value) {
                      setState(() {
                        switchColor = value;
                        if (value == true) {
                          switchColorLabel = "Yellow";
                        } else {
                          switchColorLabel = "Red";
                        }
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchLabel),
                Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                        if (value == true) {
                          switchLabel = "On";
                        } else {
                          switchLabel = "Off";
                        }
                      });
                    }),
                    
              ],
            ),
             const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){
                //누르면 스위치 값
                //String test = "test"; //일단 지역변수 하나 선언. 
                //여러개는 못보냄 그래서 쓰는게 List!!
                status.add(switchValue);
                status.add(switchColor);
                
                Navigator.pop(context, status);
              }, 
              child: const Text("OK")
              )
          ],
        ),
      ),
    );
  }
}
