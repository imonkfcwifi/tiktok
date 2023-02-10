import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';

import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import 'video_button.dart';

class VideoPost extends StatefulWidget {
  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});
  final Function onVideoFinished;
  final int index;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");
// singleTickerProviderStateMixin and Vsync provides the animation with a callback
  // Ticker will do that on every animation frame
  late final AnimationController _animationController;

  bool _isPause = false;
  bool _tapMore = false;

  final Duration _animationDuration = const Duration(milliseconds: 200);

  void _onVideoChanged() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    _videoPlayerController.play();
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoChanged);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      // default 1.5 -> 1.0
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        _isPause &&
        _videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _togglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPause = !_isPause;
    });
  }

  void _seeMore() {
    _tapMore = !_tapMore;
    setState(() {});
  }

  void _onCommentsTap(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const VideoComments(),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(child: GestureDetector(onTap: _togglePause)),
          Positioned.fill(
              child: IgnorePointer(
            child: Center(
              child: AnimatedBuilder(
                animation: _animationController,
                // listen changes
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animationController.value,
                    child: child,
                    // send widget to child:AnimatedOpacity
                  );
                },
                child: AnimatedOpacity(
                  opacity: _isPause ? 1 : 0,
                  duration: _animationDuration,
                  child: const FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                    size: Sizes.size48,
                  ),
                ),
              ),
            ),
          )),
          Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "@imonkfcwifi",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.size20),
                  ),
                  Gaps.v10,
                  const Text(
                    "KSan'te",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size16),
                  ),
                  Gaps.v10,
                  GestureDetector(
                    onTap: _seeMore,
                    child: _tapMore
                        ? const Text("#League of legend, #KsanTe, #sanTek",
                            style: TextStyle(
                                color: Colors.white, fontSize: Sizes.size16))
                        : const Text(
                            "#League.. See more",
                            style: TextStyle(
                                color: Colors.white, fontSize: Sizes.size16),
                          ),
                  ),
                ],
              )),
          Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    foregroundImage: NetworkImage(
                      "https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt15d3facea57e5b7e/634613111338101198fce129/K_Sante-Base-Splash.jpg",
                    ),
                    child: Text("크산테"),
                  ),
                  Gaps.v16,
                  const VideoButton(
                    icon: FontAwesomeIcons.solidThumbsUp,
                    text: "2.1M",
                  ),
                  Gaps.v16,
                  GestureDetector(
                    onTap: () => _onCommentsTap(context),
                    child: const VideoButton(
                      icon: FontAwesomeIcons.solidComment,
                      text: "12.13M",
                    ),
                  ),
                  Gaps.v16,
                  const VideoButton(
                    icon: FontAwesomeIcons.share,
                    text: "11.13M",
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
