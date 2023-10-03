import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nazam/main.dart';
import 'package:nazam/pages/home.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}