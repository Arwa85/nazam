import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Text('Login Page Content'),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 130),
            const CircularProgressIndicator(
              color: Colors.blue,
            ),
            Container(
              width: 500, // Width of the rectangle
              height: 100, // Height of the rectangle
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 45, 42), // Color of the rectangle
                borderRadius: BorderRadius.circular(
                    10), // Border radius to give rounded corners, if desired
              ),
            ),
          ],
        ),
      ),
    );
  }
}
