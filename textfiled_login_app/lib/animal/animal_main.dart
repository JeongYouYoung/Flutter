import 'package:flutter/material.dart';
import 'package:textfiled_login_app/animal/animal_item.dart';
import 'package:textfiled_login_app/animal/first_page.dart';
import 'package:textfiled_login_app/animal/second_page.dart';

class AnimalMain extends StatefulWidget {
  const AnimalMain({Key? key}) : super(key: key);

  @override
  State<AnimalMain> createState() => _AnimalMainState();
}

class _AnimalMainState extends State<AnimalMain>  with SingleTickerProviderStateMixin{
  
  //Property
  late TabController controller;
  List<Animal> animalList = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(
        imagePath: 'images/bee.png',
        animalName: '벌',
        kind: '곤충',
        flyExist: true));

    animalList.add(Animal(
        imagePath: 'images/cat.png',
        animalName: '고양이',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/cow.png',
        animalName: '젖소',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/dog.png',
        animalName: '강아지',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/fox.png',
        animalName: '여우',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/monkey.png',
        animalName: '원숭이',
        kind: '영장류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/pig.png',
        animalName: '돼지',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/wolf.png',
        animalName: '늑대',
        kind: '포유류',
        flyExist: false));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Test"),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: animalList),//FirstPage에게 list를 보냄.  final로 선언한부분
          SecondePage(list: animalList),//SecondPage에게 list를 보냄. final로 선언한부분
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.green,
        child: TabBar(
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}