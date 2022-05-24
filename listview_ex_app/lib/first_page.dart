import 'package:flutter/material.dart';
import 'package:listview_ex_app/flag_list.dart';

class FirstPage extends StatefulWidget {
  final List<Flag> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, position){
            return GestureDetector(
              onTap: (){
                actionName(context,position);
              },child: Card(
              child: Row(
                children: [
                  Image.asset(widget.list[position].imageFlag,
                  width: 80,
                  height: 80,),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(widget.list[position].quizName)
                ],
              ),
              ),
            );
          }
          ),
      ),
    );
  }
  actionName(BuildContext context, position){
  showDialog(
    context: context, 
    builder: (BuildContext ctx){
      return AlertDialog(
        title:  const Text("국가명"),
        content:  Text("이 국기는 ${widget.list[position].flagName}"),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: const Text('확인'))
        ],
      );
    });
  }
}