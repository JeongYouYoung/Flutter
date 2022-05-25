import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/Vol1/message.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late bool lampColor;
  late bool lampstate;
  // late String lampImage;
  // late String
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lampColor = false;
    lampstate = false;
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("수정화면"),
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Message.lampColor),
                Switch(
                    value: lampColor,
                    onChanged: (value) {
                      setState(() {
                        lampColor = value;
                        LampColors();
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Message.lampState),
                Switch(
                    value:lampstate,
                    onChanged: (value) {
                      setState(() {
                        setState(() {
                          lampstate = value;
                          LampColors();
                        });
                      });
                    }),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context,'/');
                },
                child: const Text("OK"))
          ],
        ),
      ),
    );
  }
  LampColors(){
    if(lampColor == false){
      Message.lampImage = "images/lamp_on.png";
      Message.lampColor = "Red";
      Message.lampState = "off";
    }else if(lampColor == true){
      Message.lampImage = "images/lamp_red.png";
      Message.lampColor = "Yellow";
      Message.lampState = "off";
    }else if(lampstate == true){
      Message.lampImage = "images/lamp_off.png";
      Message.lampState = "on";
    }
  }
  LampStates(){
    if(lampstate == false){
      Message.lampImage = "images/lamp_on.png";
      Message.lampState = "off";
    }else if(lampstate == true){
      Message.lampImage = "images/lamp_off.png";
      Message.lampState = "on";
    }
  }

  // LampfinalState(){
  //   Message.lampColor = LampColors();
  //   Message.lampState = LampStates();
  // }
}//end
