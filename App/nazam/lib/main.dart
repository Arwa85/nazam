import 'package:flutter/material.dart';
import 'package:nazam/pages/Login.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  //* initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const Splash(),
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
        MaterialPageRoute(builder: (context) => Login()),
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
              height: 250,
              width: 200,
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Color.fromARGB(173, 14, 54, 46),
      ),
    );
  }
}
