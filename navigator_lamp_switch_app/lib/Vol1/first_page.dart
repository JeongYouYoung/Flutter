import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/Vol1/message.dart';


class FirtstPage extends StatefulWidget {
  const FirtstPage({Key? key}) : super(key: key);

  @override
  State<FirtstPage> createState() => _FirtstPageState();
}

class _FirtstPageState extends State<FirtstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main 화면"),
        actions: [
          IconButton(
            onPressed:(){
              Navigator.pushNamed(context, "/2ed");
            }, 
            icon: Icon(Icons.mode),
            )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          height: 250,
          child: Image.asset(Message.lampImage)
          ),
      ),
    );
  }
}
