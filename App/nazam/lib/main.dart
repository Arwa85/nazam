import 'package:flutter/material.dart';
import 'package:nazam/home.dart';

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
        home: HomePage());
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
                color: Color.fromARGB(255, 146, 88, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
