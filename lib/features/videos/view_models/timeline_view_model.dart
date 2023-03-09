import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/video_model.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  final List<VideoModel> _list = [VideoModel(title: "First Video")];
  @override
  FutureOr<List<VideoModel>> build() async {
    Future.delayed(const Duration(seconds: 5));
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
