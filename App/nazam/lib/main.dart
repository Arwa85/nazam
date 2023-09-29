import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nazam/home.dart';

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
      home: HomePage(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول'),
          backgroundColor: Color.fromARGB(173, 14, 54, 46), // Set the desired color here
        
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter email address'),
                            EmailValidator(
                                errorText: 'Please enter a valid email'),
                          ]),
                          decoration: const InputDecoration(
                            hintText: 'ادخل البريد الإلكتروني',
                            labelText: 'البريد الإكتروني',
                            prefixIcon: Icon(
                              Icons.email,
                              //color: Colors.green,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Please enter Password'),
                            MinLengthValidator(8, errorText: 'Password must be at least 8 characters'),
                            PatternValidator(r'(?=.*?[#!@$%^&*-])', errorText: 'Password must contain at least one special character'),
                          ]),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.key,
                              color: const Color.fromARGB(255, 59, 152, 63),
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                        child: const Text('Forget Password!'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                navigateToHome();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              primary: Color.fromARGB(173, 14, 54, 46),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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