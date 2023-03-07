import 'package:flutter/material.dart';

class VideoCofig extends ChangeNotifier {
  bool autoMute = true;
  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoCofig();
