import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nazam/pages/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  //* Handle Password Reset
  Future<void> _resetPassword() async {
    String email = _emailController.text.trim();
    if (email.isNotEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'تم إرسال رابط إعادة تعيين كلمة المرور إلى البريد الإلكتروني الخاص بك!',
            ),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في إرسال بريد إعادة تعيين كلمة المرور.'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('الرجاء إدخال عنوان البريد الإلكتروني.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل دخول'),
        backgroundColor: const Color.fromARGB(173, 14, 54, 46),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        
        child: Column(
          children: [
            Image.asset(
              'images/logo.png', 
              width: 170,
              height: 200,
            ),
        Form(
          key: _formKey,
          child: Column(
            children: [
               
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'البريد الالكتروني',
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email is required'),
                  EmailValidator(errorText: 'Invalid email format'),
                ]),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                ),
                obscureText: true,
                validator: RequiredValidator(errorText: 'Password is required'),
              ),
              SizedBox(height: 16.0),
                 TextButton(
                onPressed: _isLoading ? null : _resetPassword,
                child: Text(
                  'هل نسيت كلمة المرور؟',
                  style: TextStyle(color: Color.fromARGB(255, 55, 145, 248)),
                ),
              ),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(173, 14, 54, 46),
                  minimumSize: Size(double.infinity, 40),
                  
                ),
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text('تسجيل دخول'
                    ,style: TextStyle(fontSize: 20),
                    
                    ), 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

        // Login successful, navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'خطأ في البريد الاكتروني او كلمة المرور, الرجاء المحاولة مرة اخرى';

        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}