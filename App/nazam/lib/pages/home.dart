import 'package:flutter/material.dart';
import 'package:nazam/components/AppBar.dart';

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
          appBar: CustomAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              color: const Color.fromARGB(255, 77, 77, 77),
            ),
          )),
    );
  }
}
