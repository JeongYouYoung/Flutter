import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';
import 'package:listview_todo_ex_app/model/todo_list.dart';
import 'package:listview_todo_ex_app/view/detail_list.dart';

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
    //넣어줄 값이 아예 없으면 initState에 안넣어줘도 됨!
    // todoList.add(TodoList(imagePath: "images/cart.png", workList: "책구매"));
    //todoList.add(
    //  TodoList(imagePath: Message.imagePath, workList: Message.workList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Text("Main View"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/insert')
                    .then((value) => rebuildData());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                //todolist의 position이 알고있는걸.workList로 넘김
                Message.imagePath = todoList[position].imagePath;
                Message.workList = todoList[position].workList;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailList(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                child: Card(
                  color: position % 2 == 0
                      ? Colors.indigo[100]
                      : Colors.indigo[200],
                  child: Row(
                    children: [
                      Image.asset(
                        todoList[position].imagePath,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        todoList[position].workList,
                        style: const TextStyle(
                          fontSize: 18
                        ),
                      ),
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

  rebuildData() {
    setState(() {
      if (Message.action) {
        todoList.add(
            TodoList(imagePath: Message.imagePath, workList: Message.workList));
      }
      Message.action = false;
    });
  }
}//end
