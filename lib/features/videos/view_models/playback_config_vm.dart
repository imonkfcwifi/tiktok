import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/video_playback_repo.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  final PlaybackConfigRepository _repository;

  PlaybackConfigViewModel(
    this._repository,
  );

  void setMuted(bool value) {
    _repository.setMuted(value);
    state = PlaybackConfigModel(muted: value, autoplay: state.autoplay);
    // 기본 state를 새 state로 대체
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    state = PlaybackConfigModel(muted: state.muted, autoplay: value);
    // 기본 state를 새 state로 대체
  }

  @override
  PlaybackConfigModel build() {
    // build method는 화면이 보길 원하는 데이터의 초기상태를 반환해야함..
    return PlaybackConfigModel(
      muted: _repository.isMuted(),
      autoplay: _repository.isAuto(),
    );
  }
  // PlaybackConfigViewModel이 build되면 (처음으로 초기화 되면)
  // PlaybackConfigModel 의 state의 data를 가지게 된다
}

final playbackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(
  () => throw UnimplementedError(),
  // 특정 함수나 기능이 아직 구현되지 않았음을 나타내는 예외
);
// send Viewmodel data to Model

// 1. Notifier<PlaybackConfigModel> 로 data 를 expose
// 2. PlaybackConfigModel build()로 data의 초기값 반환
// 3. state = 를 만들어 data 수정
// 4. Provider로 data를 원하는 곳에 배포