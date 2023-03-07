import 'package:flutter/material.dart';

class VideoConfig extends ChangeNotifier {
  bool isMuted = false;
  bool isAutoplay = false;

  void toggleIsMuted() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toggleIsPlayed() {
    isAutoplay = !isAutoplay;
    notifyListeners();
  }
}
// watch는 변경된 위젯을 rebuild , read로 메소드에 접근