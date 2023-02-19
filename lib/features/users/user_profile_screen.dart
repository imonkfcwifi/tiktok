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
        // "스크롤 가능한 구역"
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
        SliverToBoxAdapter(
          child: Column(children: const [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 20,
            )
          ]),
        ),
        SliverPersistentHeader(
          delegate: CustomDelegate(),
          pinned: true,
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

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.indigo,
      child: const FractionallySizedBox(
        heightFactor: 1,
        child: Center(
          child: Text(
            "title",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      // FractionallySizedBox : 부모로부터 최대한 많은 공간 차지
    );
  }

  @override
  double get maxExtent => 100;
  // 최대높이

  @override
  double get minExtent => 100;
// 최저높이
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
    // maxExtent , minExtent 값 변경원할시 true return
    // build에서 완전히 다른 widget tree return 시 false
  }
}
