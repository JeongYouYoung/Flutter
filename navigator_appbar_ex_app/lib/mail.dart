import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_appbar_ex_app/received_mail.dart';
import 'package:navigator_appbar_ex_app/send_mail.dart';

class mail extends StatelessWidget {
  const mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator_AppBar"),
        // leading: IconButton(
        //   onPressed: () {
        //     //
        //   },
        //   icon: const Icon(Icons.menu),
        // ),
        actions: [
          IconButton(
            onPressed: () {
             Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const send();
                    },
                  ),
                );
            },
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const received();
                    },
                  ),
                );
            },
            icon: const Icon(Icons.email_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const send();
                    },
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)
              ),
              child: const Text(
                "보낸 편지함",
              ),
            ),
             ElevatedButton(
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const received();
                    },
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange)
              ),
              child: const Text(
                "받은 편지함",
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/pikachu-1.jpg")),
              accountName: Text('pikachu'),
             accountEmail: Text("pikachu@naver.com"),
             decoration: BoxDecoration(
               color: Colors.deepOrange,
             ),
             ),
             ListTile(
               onTap: (){
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const send();
                    },
                  ),
                );
               },
               leading: const Icon(
                 Icons.email,
                 color: Colors.red,
               ),
               title: const Text("보낸 편지함"),
             ),
              ListTile(
               onTap: (){
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const received();
                    },
                  ),
                );
               },
               leading: const Icon(
                 Icons.email_outlined ,
                 color: Colors.blue,
               ),
               title: const Text("받은 편지함"),
             )
          ],
        ),
      ),
    );
  }
}