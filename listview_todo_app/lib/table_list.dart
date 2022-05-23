import 'package:flutter/material.dart';
import 'package:listview_todo_app/detail_list.dart';
import 'package:listview_todo_app/message.dart';
import 'package:listview_todo_app/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  List<TodoList> todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //우리가 원하는 type으로 넣어주려고 생성자를 만든거야
    //한번에 두개 넣으려고 생성자를 만들어준거임!

    //todoList[0]
    todoList.add(TodoList(imagePath: "images/cart.png", workList: "책구매"));
    //todoList[1]
    todoList.add(TodoList(imagePath: "images/clock.png", workList: "철수와 약속"));
    //todoList[2]
    todoList
        .add(TodoList(imagePath: "images/pencil.png", workList: "스터디 준비하기"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text("Main View"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(
              Icons.add_outlined,
            ),
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          //스크롤도 자연스럽게 됨.
          itemCount: todoList.length, //길이를 알면 알아서 생성됨. for문 안써도 됨
          itemBuilder: (context, position) {
            //클릭하는걸 알아야해서 사용함
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: GestureDetector(
                onTap: () {
                  //todolist의 position이 알고있는걸.workList로 넘김
                  Message.workList = todoList[position].workList;
                  Message.imagePath = todoList[position].imagePath;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailList(),
                    ),
                  );
                },
                child: Card(
                  //테두리가 있는 박스가 카드, 클릭기능은 없음. 안에 넣어줘야함. GestureDetector
                  color: position % 2 == 0
                      ? Colors.deepPurple[100]
                      : Colors.deepPurple[200],
                  child: Row(
                    children: [
                      Image.asset(
                        // 이미지만 있으면 웹툰볼때랑 똑같
                        todoList[position].imagePath,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(todoList[position].workList)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
