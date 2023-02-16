import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // sliver "just a scroll view"
        SliverAppBar(
          snap: true,
          floating: true,
          // 스크롤시 appbar 보여줌
          stretch: true,
          pinned: true,
          backgroundColor: Colors.green,
          expandedHeight: 200,
          collapsedHeight: 80,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              "assets/images/placeholder.jpg",
              fit: BoxFit.cover,
            ),
            title: const Text("Users"),
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) => Container(
                color: Colors.teal[100 * (index % 9)],
                child: Align(
                    alignment: Alignment.center, child: Text('data $index')),
              ),
            ),
            itemExtent: 100),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) => Container(
                color: Colors.red[100 * (index % 9)],
                child: Align(
                    alignment: Alignment.center, child: Text('data $index')),
              ),
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisSpacing: Sizes.size20,
              crossAxisSpacing: Sizes.size20,
              childAspectRatio: 1,
            ))
      ],
    );
  }
}
