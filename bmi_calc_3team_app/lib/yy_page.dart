
import 'package:bmi_calc_3team_app/bmi_check_page.dart';
import 'package:bmi_calc_3team_app/bmi_cilck_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const YyPage());
}

class YyPage extends StatelessWidget {
  const YyPage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context) => const Bmi_click_page(),
        '/bc' :(context) => const Bmi_check_page(),
      },
      initialRoute: '/',
    );
  }
}
