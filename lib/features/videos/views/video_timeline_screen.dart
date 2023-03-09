import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/view_models/timeline_view_model.dart';

import 'widgets/video_post.dart';
// consumer 하면서 ref에 접근 (Video Timeline Provider를 읽음)

class VideoTimeLineScreen extends ConsumerStatefulWidget {
  const VideoTimeLineScreen({super.key});

  @override
  VideoTimeLineScreenState createState() => VideoTimeLineScreenState();
}

class VideoTimeLineScreenState extends ConsumerState<VideoTimeLineScreen> {
  final Duration _scrollDuration = const Duration(milliseconds: 250);
  final Curve _scrollCurve = Curves.linear;
  int _itemCount = 4;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;

      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
  }

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(timeLineProvider).when(
          // AsyncProvider를 쓰기때문에 when 을 써서
          // loading 중일때 error가 떴을때 data를 가졌을때 각각 다른 행동 가능
          data: (videos) => RefreshIndicator(
            onRefresh: _onRefresh,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: _onPageChanged,
              itemCount: videos.length,
              itemBuilder: (context, index) =>
                  VideoPost(onVideoFinished: _onVideoFinished, index: index),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text(
              "load error : $error",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          // API를 불러올때
        );
  }
}
