import 'package:flutter/material.dart';
import 'package:textfiled_login_app/animal/animal_item.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;//선언한 list를 3.0으로 넘어오면서 widget으로 들고올수 있음
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(// list가 있는만큼 만들어주는애
          
            itemCount: widget.list.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: (){
                  actionKind(context, position);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                      Text("      ${widget.list[position].animalName}")
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
//-----------------Function
actionKind(BuildContext context, position){
  showDialog(
    context: context, 
    builder: (BuildContext ctx){
      return AlertDialog(
        title:  Text(widget.list[position].animalName),
        content:  Text("이 동물은 ${widget.list[position].kind}"),
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



}//end
