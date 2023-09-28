import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Stack(children: <Widget>[
              TabBarView(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Container(
                    color: Colors.black,
                  ),
                  Container(
                    color: Colors.white,
                  ),
                ],
              ),
              Container(
                height: 20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Color.fromRGBO(238, 235, 235, 1),
                ),
              )
            ]),
            appBar: AppBar(
                elevation: 0,
                backgroundColor: const Color.fromRGBO(238, 235, 235, 1),
                title: const TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.account_circle),
                    ),
                    Tab(
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      icon: Icon(Icons.list),
                    ),
                  ],
                  labelColor: Color.fromRGBO(43, 101, 109, 1),
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(8.0),
                )),
            backgroundColor: const Color.fromRGBO(238, 235, 235, 1),
          ),
        ),
      ),
    );
  }
}
