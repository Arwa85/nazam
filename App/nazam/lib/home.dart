import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      icon: Icon(
                        Icons.account_circle,
                        size: 40.0,
                      ),
                    ),
                    Tab(
                      icon: Image(
                        image: AssetImage('images/logo.png'),
                        height: 400,
                        width: 300,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.menu,
                        size: 40.0,
                      ),
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
