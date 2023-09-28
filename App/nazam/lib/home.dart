import 'package:flutter/material.dart';
import 'package:nazam/profile.dart';

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(238, 235, 235, 1),
          centerTitle: true,
          actions: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    size: 40.0,
                    color: Color.fromRGBO(43, 101, 109, 1),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => profile(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Image(
                    image: AssetImage('images/logo.png'),
                    height: 120,
                    width: 120,
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
                      size: 40.0, color: Color.fromRGBO(43, 101, 109, 1)),
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
        body: const Center(
          child: Text('Welcome to the App'),
        ),
      ),
    );
  }
}
