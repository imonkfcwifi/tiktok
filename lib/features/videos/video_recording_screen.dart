import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/video_preview_screen.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin {
  bool _hasPer = false;
  bool _isSelfie = false;
  late FlashMode _flashMode;
  late CameraController _cameraController;
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.3).animate(_animationController);
  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 60),
    lowerBound: 0.0,
    upperBound: 1.0,
  );
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }
    _cameraController = CameraController(
      cameras[_isSelfie ? 1 : 0],
      ResolutionPreset.ultraHigh,
    );
    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording();
    _flashMode = _cameraController.value.flashMode;
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
    _progressAnimationController.addListener(() {
      setState(() {});
    });
    _progressAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _stopRecording();
      }
    });
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfie = !_isSelfie;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _startRecording(TapDownDetails context) async {
    if (_cameraController.value.isRecordingVideo) return;

    await _cameraController.startVideoRecording();
    _animationController.forward();
    _progressAnimationController.forward();
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isRecordingVideo) return;
    _animationController.reverse();
    _progressAnimationController.reset();

    final video = await _cameraController.stopVideoRecording();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPreviewScreen(video: video),
        ));
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    _cameraController.dispose();
    _animationController.dispose();
    super.dispose();
  }

// 9:50
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                  CircularProgressIndicator.adaptive(),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    top: Sizes.size20,
                    right: Sizes.size20,
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: _toggleSelfieMode,
                          icon: const Icon(Icons.cameraswitch),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.off
                              ? Colors.yellow
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.off),
                          icon: const Icon(Icons.flash_off_rounded),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.always
                              ? Colors.yellow
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.always),
                          icon: const Icon(Icons.flash_on_rounded),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.auto
                              ? Colors.yellow
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.auto),
                          icon: const Icon(Icons.flash_auto_rounded),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.torch
                              ? Colors.yellow
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.torch),
                          icon: const Icon(Icons.flashlight_on_rounded),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size40,
                    child: GestureDetector(
                      onTapDown: _startRecording,
                      onTapUp: (details) => _stopRecording,
                      child: ScaleTransition(
                        scale: _buttonAnimation,
                        child: Stack(alignment: Alignment.center, children: [
                          SizedBox(
                            width: Sizes.size80 + Sizes.size14,
                            height: Sizes.size80 + Sizes.size14,
                            child: CircularProgressIndicator(
                              strokeWidth: Sizes.size6,
                              value: _progressAnimationController.value,
                              color: Colors.red.shade400,
                            ),
                          ),
                          Container(
                            width: Sizes.size80,
                            height: Sizes.size80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade500,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
