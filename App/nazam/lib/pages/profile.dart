import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nazam/components/AppBar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 70,
                    // backgroundImage: AssetImage('images/logo.png'),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('الاسم'),
                    subtitle: Text('منال الحارثي'),
                    leading: Icon(CupertinoIcons.person),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    title: Text('البريد الإلكتروني'),
                    subtitle: Text(user.email!),
                    leading: Icon(CupertinoIcons.mail),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    title: Text('الرقم الوظيفي'),
                    subtitle: Text('123456'),
                    leading: Icon(CupertinoIcons.number),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    title: Text('رقم الهاتف'),
                    subtitle: Text('0123456789'),
                    leading: Icon(CupertinoIcons.phone),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    title: Text('تاريخ الميلاد'),
                    subtitle: Text('1 يناير 1990'),
                    leading: Icon(CupertinoIcons.calendar),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    title: Text('الجنسية'),
                    subtitle: Text('المملكة العربية السعودية'),
                    leading: Icon(CupertinoIcons.flag),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    title: Text('العنوان'),
                    subtitle: Text('شارع الملك فهد'),
                    leading: Icon(CupertinoIcons.location),
                    tileColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}