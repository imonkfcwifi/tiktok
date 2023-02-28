import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  bool _hasPer = false;
  late final CameraController _cameraController;
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.ultraHigh,
    );
    await _cameraController.initialize();
  }

  Future<void> initPermissions() async {
    final cameraP = await Permission.camera.request();
    final micP = await Permission.microphone.request();

    final cameraDenied = cameraP.isDenied || cameraP.isPermanentlyDenied;

    final micDenied = micP.isDenied || micP.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPer = true;
      await initCamera();
      setState(() {});
    } else {}
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

// 9:50
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPer || !_cameraController.value.isInitialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "data permission",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator(),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                ],
              ),
      ),
    );
  }
}
