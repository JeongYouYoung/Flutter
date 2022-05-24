import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController insert;
  late bool buy;
  late bool promise;
  late bool study;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    insert = TextEditingController();
    buy = true;
    promise = false;
    study = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Page"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("구매"),
          Switch(
            value: buy, 
            onChanged: (value){
              setState(() {
                buy = value;
                swichFunctionBuy();
              });
              
            },
            ),
            Image.asset("images/cart.png")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("약속"),
          Switch(
            value: promise, 
            onChanged: (value){
              setState(() {
                promise = value;
                swichFunctionPromise();
              });
              
            },
            ),
            Image.asset("images/clock.png")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("스터디"),
          Switch(
            value: study, 
            onChanged: (value){
              setState(() {
               study = value;
               swichFunctionStudy();
              });
              
            },
            ),
            Image.asset("images/pencil.png")
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: insert,
              decoration: const InputDecoration(
                labelText: '목록을 입력하세요'
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          ElevatedButton(
            onPressed: (){
              if(insert.text.trim().isNotEmpty){
                addList();
              }Navigator.pop(context);
            }, 
            child: const Text("OK")
            )
        ]
        ),
    );
  }

swichFunctionBuy(){
  if(buy == true){
    promise = false;
    study = false;
  }else{
    buy = true;
  }
}
swichFunctionPromise(){
  if(promise == true){
    buy = false;
    study = false;}
    else{
    buy = true;
  }
}
swichFunctionStudy(){
  if(study == true){
    buy = false;
    promise = false;
  }else{
    buy = true;
  }
}

addList(){
  if(buy == true){
    Message.imagePath = "images/cart.png";
    Message.workList = insert.text;
    Message.action = true;
  }else if(promise == true){
    Message.imagePath = "images/clock.png";
    Message.workList = insert.text;
    Message.action = true;
  }else if(study == true){
    Message.imagePath = "images/pencil.png";
    Message.workList = insert.text;
    Message.action = true;
  }
}

}//end