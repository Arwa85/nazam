import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nazam/components/appBar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isWorking = false;
  CameraController? cameraController;
  FaceDetector? faceDetector;
  Size? size;
  List<Face>? facesList;
  CameraDescription? description;
  CameraLensDirection cameraLensDirection = CameraLensDirection.front;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    PermissionStatus cameraStatus = await Permission.camera.request();

    if (cameraStatus == PermissionStatus.granted) {}
    if (cameraStatus == PermissionStatus.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("يوصى بقبول طلب الأذن بوصول للكاميرا")));
    }

    if (cameraStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.black,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            color: const Color.fromARGB(255, 167, 167, 167),
          ),
        ),
      ),
    );
  }
}
