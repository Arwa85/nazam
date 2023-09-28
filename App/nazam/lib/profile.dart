import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nazam/home.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  icon: const Icon(Icons.menu,
                      size: 50.0, color: Color.fromRGBO(43, 101, 109, 1)),
                  itemBuilder: (
                    BuildContext context,
                  ) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'option1',
                        child: Text('Option 1'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'option2',
                        child: Text('Option 2'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'option3',
                        child: Text('Option 3'),
                      ),
                    ];
                  },
                  onSelected: (String value) {
                    // Handle menu item selection
                  },
                ),
              ],
            )),
          ],
        ),
        body: const Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('images/logo.png'),
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
                    subtitle: Text('example@example.com'),
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
                  ListTile(
                    title: Text('القسم'),
                    subtitle: Text('الموارد البشرية'),
                    leading: Icon(CupertinoIcons.folder),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
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
