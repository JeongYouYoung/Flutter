import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app2/message.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // if문이 들어옴!
    //컬러값!
    if (Message.lampColor) {
      switchColorLabel = "Yellow";
      switchColor = true;
    } else {
      switchColorLabel = "red";
      switchColor = false;
    }
    // On,Off 값!
    if (Message.lampStatus) {
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
                Message.lampStatus = switchValue;
                Message.lampColor = switchColor;
                Navigator.pop(context);
              }, 
              child: const Text("OK")
              )
          ],
        ),
      ),
    );
  }
}
