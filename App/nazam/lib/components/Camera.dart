import 'package:permission_handler/permission_handler.dart';

Future<void> requestCameraPermission() async {
  PermissionStatus status = await Permission.camera.request();
  if (status.isGranted) {
    // Camera permission granted
  } else {
    // Handle permission denied
  }
}
