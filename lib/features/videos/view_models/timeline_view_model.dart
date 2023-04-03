import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/video_model.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  List<VideoModel> _list = [];

  void uploadVideo() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 5));

    _list = [
      ..._list,
    ];
    // ...list 기존에 리스트에 있던거 전부 가져오기
    state = AsyncValue.data(_list);
    // AsyncNotifier 에 있기 때문에
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    await Future.delayed(const Duration(seconds: 5));

    // API로 부터 응답시간 약 5초

    return _list;
  }
}

final timeLineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
// build 메소드 에서 원하는 API 호출
// 데이터 반환 (return _list)
// 데이터는 provider ; AsyncNotifier<List<videoModel>> 에 의해 expose 됨\
// arrow function 으로 초기화 해주면서 TimeLineViewModel 설정
