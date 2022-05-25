import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_lamp_app/message.dart';

class ModifyPage extends StatefulWidget {
  const ModifyPage({Key? key}) : super(key: key);

  @override
  State<ModifyPage> createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
late TextEditingController textEditingController2;
  late bool switchValue;
  late String onoff;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Message.lamp == true) {
      switchValue = true;
      onoff = "On";
    } else {
      switchValue = false;
      onoff = "Off";
    }

     textEditingController2 = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(onoff),
                  Switch(
                      value: Message.lamp,
                      onChanged: (value) {
                        //
                        setState(() {
                          Message.lamp = switchValue;
                          switchValue = value;
                          if (value == true) {
                            Message.lamp = true;
                          } else {
                            Message.lamp = false;
                          }
                        });
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    //
                    setState(() {});
                    Message.lamp = switchValue;
                    Message.text= textEditingController2.text;
                    Navigator.pop(context);
                  },
                  child: const Text("입력")),
            )
          ],
        ),
      ),
    );
  }
}
