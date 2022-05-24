import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:listview_app/animal_item.dart';

class SecondePage extends StatefulWidget {
  final List<Animal> list;
  const SecondePage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondePage> createState() => _SecondePageState();
}

class _SecondePageState extends State<SecondePage> {
  // 이런식으로 선언할수도 있음
  final nameController = TextEditingController();
  int _radioValue = 0;
  bool flyExist = false;
  var _imagePath;
  String imageName = "";

  //--------원래 쓰던 선언법
  //late TextEditingController nameController;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   nameController = TextEditingController();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1, //한줄만 쓸수 있어!
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Radio(
                  //스위치랑 비슷
                  value: 0, //순서값 벨류값이 뭐가 들어올지 알아야 하니까 넣어줘야함
                  groupValue: _radioValue, //만들어놓은 그룹에서 하나만 쓸수 있게 하려고
                  onChanged: _radioChange,
                ),
                const Text("양서류"),
                Radio(
                  value: 1, //순서값
                  groupValue: _radioValue, //만들어놓은 그룹에서 하나만 쓸수 있게 하려고
                  onChanged: _radioChange,
                ),
                const Text("파충류"),
                Radio(
                  value: 2, //순서값
                  groupValue: _radioValue, //만들어놓은 그룹에서 하나만 쓸수 있게 하려고
                  onChanged: _radioChange,
                ),
                const Text("포유류"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("날 수 있나요?"),
                Checkbox(
                    value: flyExist,
                    onChanged: (check) {
                      setState(() {
                        flyExist = check!;
                      });
                    })
              ],
            ),
            Container(
              height: 100,
              child: ListView(
                // 내가 직접 만들어야하는애
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                      onTap: () {
                        _imagePath = "images/cow.png";

                        setState(() {
                          //이미지 이름
                          imageName = "젖소";
                        });
                      },
                      child: Image.asset(
                        "images/cow.png",
                        width: 80,
                      )),
                  GestureDetector(
                      onTap: () {
                        _imagePath = "images/pig.png";

                        setState(() {
                          //이미지 이름
                          imageName = "돼지";
                        });
                      },
                      child: Image.asset(
                        "images/pig.png",
                        width: 80,
                      )),
                  GestureDetector(
                      onTap: () {
                        _imagePath = "images/bee.png";

                        setState(() {
                          //이미지 이름
                          imageName = "벌";
                        });
                      },
                      child: Image.asset(
                        "images/bee.png",
                        width: 80,
                      )),
                  GestureDetector(
                      onTap: () {
                        _imagePath = "images/cat.png";

                        setState(() {
                          //이미지 이름
                          imageName = "고양이";
                        });
                      },
                      child: Image.asset(
                        "images/cat.png",
                        width: 80,
                      )),
                  GestureDetector(
                      onTap: () {
                        _imagePath = "images/fox.png";

                        setState(() {
                          //이미지
                          imageName = "여우";
                        });
                      },
                      child: Image.asset(
                        "images/fox.png",
                        width: 80,
                      )),
                  GestureDetector(
                      onTap: () {
                        _imagePath = "images/monkey.png";

                        setState(() {
                          //이미지
                          imageName = "원숭이";
                        });
                      },
                      child: Image.asset(
                        "images/monkey.png",
                        width: 80,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(imageName),
            ),
            ElevatedButton(
                onPressed: () {
                  //동물추가하는데 저장해야할것을 하나 추가해야함
                  var animal = Animal(
                      animalName: nameController.text,
                      kind: getKind(_radioValue), //글자로 들어옴
                      imagePath: _imagePath,
                      flyExist: flyExist);

                  AlertDialog dialog = AlertDialog(
                    title: const Text("동물 추가하기"),
                    content: Text(
                      //값 하나씩 밖에 안들어감
                      "이 동물은 ${animal.animalName} 입니다."
                      "또 동물의 종류는 ${animal.kind} 입니다. \n"
                      //'안에 "" 를 사용가능!'
                      '이 동물은 ${animal.flyExist ? "날수 있습니다" : "날수 없습니다."} \n'
                      '이 동물을 추가하시 겠습니까?',
                      style: const TextStyle(fontSize: 17),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          //리스트에 추가해야함
                          widget.list.add(animal);
                          Navigator.of(context).pop(); //alert만 날라가는것
                        },
                        child: const Text("예"),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, //alert만 날라가는것
                          child: const Text(
                            "아니오",
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return dialog;
                      });
                },
                child: const Text("동물 추가하기"))
          ],
        ),
      ),
    );
  }

//---------Function
//radio버튼에서 아무것도 클릭이 안될수 있어서 null값이 들어오게될 상황때문에 ? 사용
//null값을 반환할때 반환값으로 주기위해 !(null saftiy) 사용
  _radioChange(int? value) {
    setState(() {
      _radioValue = value!;
      //?는 null이 들어올수 있어서 넣어주는것 ,
      //!는 null널을 해제해주는것
    });
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return '포유류';
    }
  }
}//end
