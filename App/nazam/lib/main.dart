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
        
        home: WelcomePage());
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nazam'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/logo.png'),
              height: 400,
              width: 300,
            ),
            Text(
              "مرحبا بك في نظّم",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Marhey',
                  height: 1,
                  color:Color.fromARGB(255, 146, 88, 0),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
