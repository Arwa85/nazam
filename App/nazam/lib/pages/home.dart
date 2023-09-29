import 'package:flutter/material.dart';
import 'package:nazam/components/AppBar.dart';
import 'package:permission_handler/permission_handler.dart';

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
          appBar: const CustomAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () async {
                    PermissionStatus cameraStatus =
                        await Permission.camera.request();

                    if (cameraStatus == PermissionStatus.granted) {
                      print('hhhhhhhhhh');
                    }
                    if (cameraStatus == PermissionStatus.denied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("يوصى بقبول طلب الأذن بوصول للكاميرا")));
                    }

                    if (cameraStatus == PermissionStatus.permanentlyDenied) {
                      openAppSettings();
                    }
                  },
                  child: const Text("start")),
            ),
          )),
    );
  }
}
