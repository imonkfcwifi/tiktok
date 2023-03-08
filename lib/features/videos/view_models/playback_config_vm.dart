import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/video_playback_repo.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  final PlaybackConfigRepository _repository;

  late final PlaybackConfigModel _model = PlaybackConfigModel(
    muted: _repository.isMuted(),
    autoplay: _repository.isAuto(),
  );

  PlaybackConfigViewModel(this._repository);
  bool get muetd => _model.muted;
  // 익명성을 위해 실제 _model에 접근해서 mueted 반환
  bool get autoplay => _model.autoplay;

  void setMuted(bool value) {
    _repository.setMuted(value);
    // 내 repo 에서 value를 disk에 persist
    _model.muted = value;
    // model 수정
    notifyListeners();
    // listen하고 있는 모두에게 notify
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    // 내 repo 에서 value를 disk에 persist
    _model.autoplay = value;
    // model 수정
    notifyListeners();
    // listen하고 있는 모두에게 notify
  }
}
