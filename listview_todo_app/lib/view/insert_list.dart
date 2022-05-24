import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsetrList extends StatefulWidget {
  const InsetrList({Key? key}) : super(key: key);

  @override
  State<InsetrList> createState() => _InsetrListState();
}

class _InsetrListState extends State<InsetrList> {
  //입력한 정보를 변수를 여기에 추가하면 공유가 안되기때문에 Mesaage로 보내줌.
  late TextEditingController textEditingController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: const Text('Insert Page'),
        backgroundColor: Colors.indigoAccent,
      ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
             controller: textEditingController,
             decoration: const InputDecoration(
              labelText : '목록을 입력하세요'
               ), 
               keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: (){
                //InsertList에서 버튼을 눌렀다
                if(textEditingController.text.trim().isNotEmpty){
                  addList();//데이터에 뭔가 들어왔을때 하는애
                }
                //버튼을 누르면 입력한 값을 context가 들고 table_list로 넘어감.
                //내 생각임. -> navigator.pop로 넘기면 네비화면으로 넘기면서 현재 화면이 없어지는데
                //입력받은화면의 context를 다음화면(table_list)으로 넘겨주는게 아닌가...?
                Navigator.pop(context);
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigoAccent)
              ),
              child: const Text("OK")
              ),
          ],
        ),
      ),
    ),
    );
  }
  //-------Function
  addList(){
    //이미지는 일단 디폴드값
    Message.imagePath="images/pencil.png";
    //내용은 사용자가 입력한 정보
    Message.workList=textEditingController.text;
    //데이터가 있으면 오는곳 ,없으면 그냥pop()으로 옴
    //지금 입력됬으면 true로 넘어감. table_list Function으로 넘어간다.
    Message.action = true;
  }
}//End
