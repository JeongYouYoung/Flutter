import 'package:flutter/material.dart';

import 'package:navigator_lamp_app/message.dart';

class ModifyPage extends StatefulWidget {
  const ModifyPage({Key? key}) : super(key: key);

  @override
  State<ModifyPage> createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
late TextEditingController text2;
  late bool switchValue;
  late String onoff;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
   
    text2 = TextEditingController();
    text2.text = Message.text;
    if(Message.lamp){
      onoff = "on";
      switchValue = true; 
    }else{
      onoff = "off";
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: text2,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(onoff),
                  Switch(
                      value: switchValue,
                      onChanged: (value) {
                        switchValue = value;
                        setState(() {
                         if(value){
                           onoff = "on";
                         }else{
                           onoff = "off";
                         }
                          }
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    
                    setState(() {
                    Message.lamp = switchValue;
                    Message.text = text2.text;
                    });
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