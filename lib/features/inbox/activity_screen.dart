import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _notification = List.generate(20, (index) => "${index}h");

  void _onDismissed(String notification) {
    _notification.remove(notification);
  }

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));

  // init 안해도 됨

  late final Animation<double> _animation =
      Tween(begin: 0.0, end: 0.5).animate(_animationController);

  void _onTitleTap() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _onTitleTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("All activity"),
              Gaps.h2,
              RotationTransition(
                turns: _animation,
                child: const FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: Sizes.size14,
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        children: [
          Gaps.v12,
          const Text(
            "New",
            style: TextStyle(fontSize: Sizes.size14, color: Colors.grey),
          ),
          Gaps.v14,
          for (var notification in _notification)
            Dismissible(
              onDismissed: (notification) => _onDismissed,
              key: Key(notification),
              // item들이 각각 다른 notification 을 갖게됨 (unique key)
              background: Container(
                alignment: Alignment.centerLeft,
                // container 안에 있는 아이템 정렬
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.only(left: Sizes.size10),
                  child: FaIcon(FontAwesomeIcons.airbnb),
                ),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                // container 안에 있는 아이템 정렬
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.only(right: Sizes.size10),
                  child: FaIcon(FontAwesomeIcons.airbnb),
                ),
              ),
              child: ListTile(
                minVerticalPadding: Sizes.size16,
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size32,
                  color: Colors.white,
                ),
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: Sizes.size52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey.shade400, width: Sizes.size1),
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.bell,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: "Account Updates",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text: " Upload longer video",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      TextSpan(
                        text: " $notification",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
