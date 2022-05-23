import 'package:flutter/material.dart';

class Bmi_check_page extends StatefulWidget {
  const Bmi_check_page({Key? key}) : super(key: key);

  @override
  State<Bmi_check_page> createState() => _Bmi_check_pageState();
}

class _Bmi_check_pageState extends State<Bmi_check_page> {
  late TextEditingController kg;
  late TextEditingController m;
  late TextEditingController sum;
  late TextEditingController state;

  @override
  void initState() {
    kg = TextEditingController();
    m = TextEditingController();
    sum = TextEditingController();
    state = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: const Text("BMI Check"),
        backgroundColor: Colors.deepPurple[300],
        foregroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage("images/chun01.jpeg"),
            radius: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: kg,
              decoration: const InputDecoration(labelText: "몸무게를 입력하세요(kg)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: m,
              decoration: const InputDecoration(labelText: "신장를 입력하세요(cm)"),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                       if (kg.text.trim().isEmpty) {
                            errorSnacKBar1(context);
                          } else if (m.text.trim().isEmpty) {
                            errorSnacKBar2(context);
                          } else {
                            statebmi(); 
                          }
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                  ),
                  child: const Text("계산하기"),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    kg.text = "";
                    m.text = "";
                    sum.text = "";
                    state.text = "";
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                  ),
                  child: const Text("지우기"),
                ),
              ],
            ),
            TextField(
                readOnly: true,
                controller: sum,
                decoration: const InputDecoration(
                  labelText: "BMI 지수",
                )),
            TextField(
                readOnly: true,
                controller: state,
                decoration: const InputDecoration(
                  labelText: "상태 결과",
                )),
          ],
        ),
      ),
    );
  }

  statebmi() {
    sum.text = ((int.parse(kg.text)/((int.parse(m.text)/100)*(int.parse(m.text)/100))).toStringAsFixed(2));
    if ((double.parse(sum.text)) < 18.5) {
      state.text = "저체중 입니다.";
    } else if (18.5 <= (double.parse(sum.text)) &&
        (double.parse(sum.text)) < 23) {
      state.text = "정상 체중 입니다.";
    } else if (23 <= (double.parse(sum.text)) &&
        (double.parse(sum.text)) < 25) {
      state.text = "과체중 입니다.";
    } else if (25 <= (double.parse(sum.text)) &&
        (double.parse(sum.text)) < 30) {
      state.text = "비만 입니다.";
    } else if ((double.parse(sum.text)) >= 30) {
      state.text = "고도비만 입니다.";
    }
  }


  //SnacKBar Function-----------------------------------------------------
  errorSnacKBar1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('체중을 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnacKBar2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('신장을 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}//end
