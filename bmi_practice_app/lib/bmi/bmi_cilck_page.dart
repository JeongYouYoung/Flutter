import 'package:flutter/material.dart';

class Bmi_click_page extends StatefulWidget {
  const Bmi_click_page({Key? key}) : super(key: key);

  @override
  State<Bmi_click_page> createState() => _Bmi_click_pageState();
}

class _Bmi_click_pageState extends State<Bmi_click_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: const Text("Your Health"),
        backgroundColor: Colors.deepPurple[300],
        foregroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            //
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage("images/chun1.jpeg"),
            radius: 40,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/BMI.jpeg"),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "BMI",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 3),
          ),
          const Text(
            "Body Mass Index",
            style: TextStyle(fontSize: 20, letterSpacing: 3),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bc');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple[300])
              ),
              child: const Text("BMI 측정하러가기"),
              )
        ],
      ),
    );
  }
}
