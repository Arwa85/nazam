import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class scanner {
  scanner._();
  static Future<CameraDescription> getCamera(
      CameraLensDirection cameraLensDirection) async {
    return await availableCameras().then((List<CameraDescription> cameras) =>
        cameras.firstWhere((CameraDescription cameraDescription) =>
            cameraDescription.lensDirection == cameraLensDirection));
  }
}
