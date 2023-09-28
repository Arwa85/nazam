import 'package:flutter/material.dart';
import 'package:nazam/profile.dart';

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
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(238, 235, 235, 1),
            toolbarHeight: 100,
            centerTitle: true,
            actions: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.account_circle,
                      size: 50.0,
                      color: Color.fromRGBO(43, 101, 109, 1),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    iconSize: 80.0,
                    icon: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/logo.png'))),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.menu,
                        size: 50.0, color: Color.fromRGBO(43, 101, 109, 1)),
                    itemBuilder: (
                      BuildContext context,
                    ) {
                      return [
                        const PopupMenuItem<String>(
                          value: 'option1',
                          child: Text('Option 1'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'option2',
                          child: Text('Option 2'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'option3',
                          child: Text('Option 3'),
                        ),
                      ];
                    },
                    onSelected: (String value) {
                      // Handle menu item selection
                    },
                  ),
                ],
              )),
            ],
          ),
          body: Container(color: const Color.fromARGB(255, 77, 77, 77))),
    );
  }
}
