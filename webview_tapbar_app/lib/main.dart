import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_tapbar_app/message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool isLoading = true; //for indigator골뱅이
  //사이트 변수 만들어주기
  late String siteName;
  late TextEditingController inputSite;
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    super.initState();
    inputSite = TextEditingController();
    siteName = Message.sitename;
  }

  @override
  void dispose() {
    tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: inputSite,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text("Site를 입력하세요")),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //siteName 이 사이트를 변경해주는 변수.
                siteName = inputSite.text;
                setState(() {
                  Message.sitename;
                });
                _relodesite();
              },
              icon: const Icon(Icons.sledding))
        ],
        toolbarHeight: 60,
      ),
      body: Stack(
        //body에 Stack가 풀로 꽉쓰겠다는 뜻
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              //화면구성시 어떻게 할껀가
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) {
              //다받았다
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
          TabBarView(
            controller: tabController,
            children: [
              WebView(
                initialUrl: 'https://${Message.naver}',
                
                onPageFinished: (finish) {
                  //다받았다
                  setState(() {
                    isLoading = false;
                  });
                },
                onPageStarted: (start) {
                  setState(() {
                    isLoading = true;
                  });
                },
              ),
              WebView(
                initialUrl: 'https://${Message.google}',
                
                onPageFinished: (finish) {
                  //다받았다
                  setState(() {
                    isLoading = false;
                  });
                },
                onPageStarted: (start) {
                  setState(() {
                    isLoading = true;
                  });
                },
              ),
              WebView(
                initialUrl: 'https://${Message.daum}',
                
                onPageFinished: (finish) {
                  //다받았다
                  setState(() {
                    isLoading = false;
                  });
                },
                onPageStarted: (start) {
                  setState(() {
                    isLoading = true;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      //back버튼.
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future, //화면 보여줄때 보여줄 준비를 다하고 보여줘야함
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            //위치를 알아야하니까context
            if (controller.hasData) {
              return FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    controller.data!.goBack();
                  },
                  child: const Icon(Icons.arrow_back));
            }
            return Stack();
          }),
          bottomNavigationBar: Container(
            color: Colors.indigo,
            child: TabBar(
              controller: tabController,
              tabs:[
                Tab(
                  icon: 
                  Image.asset("images/naver.jpeg",width: 30, height: 30),
                ),
                Tab(
                  icon: 
                  Image.asset("images/google.png",width: 50, height: 50),
                ),
                Tab(
                  icon: 
                  Image.asset("images/daum.jpeg" , width: 50, height: 50,),
                ),

              ]
            ),
          ),
    );
  }

//-------Function
  _relodesite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }
} //end
