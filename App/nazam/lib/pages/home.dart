import 'package:flutter/material.dart';
import 'package:nazam/pages/profile.dart';
import 'package:nazam/pages/viewIncident.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//lll
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
                    position: PopupMenuPosition.under,
                    elevation: 8.0,
                    icon: const Icon(Icons.menu,
                        size: 50.0, color: Color.fromRGBO(43, 101, 109, 1)),
                    itemBuilder: (
                      BuildContext context,
                    ) {
                      TextDirection.rtl;
                      return [
                        PopupMenuItem<String>(
                          value: 'option1',
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              ('الابلاغ عن حادثة'),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'option2',
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              ('عرض الحوادث'),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'option3',
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              ('الاعدادات'),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                    onSelected: (String value) {
                      // Handle menu item selection
                      if (value == 'option1') {
                      } else if (value == 'option2') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewIncidentPage()),
                        );
                      } else if (value == 'option3') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewIncidentPage()),
                        );
                      }
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
