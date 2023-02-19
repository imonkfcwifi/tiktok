import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('imonkfcwifi'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                  size: Sizes.size20,
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  foregroundColor: Colors.teal,
                  foregroundImage: NetworkImage(
                    "https://cdn.eyesmag.com/content/uploads/posts/2022/08/08/main-ad65ae47-5a50-456d-a41f-528b63071b7b.jpg",
                  ),
                  child: Text("user"),
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "@imonkfcwifi",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size18,
                      ),
                    ),
                    Gaps.h5,
                    FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: Sizes.size16,
                      color: Colors.blue.shade500,
                    ),
                  ],
                ),
                Gaps.v20,
                SizedBox(
                  height: Sizes.size52,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "10M",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size18),
                          ),
                          Gaps.v3,
                          Text(
                            "following",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        width: Sizes.size32,
                        thickness: 1,
                        color: Colors.grey.shade500,
                        indent: Sizes.size14,
                        endIndent: Sizes.size10,
                      ),
                      Column(
                        children: [
                          const Text(
                            "3k",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size18),
                          ),
                          Gaps.v3,
                          Text(
                            "likes",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        width: Sizes.size32,
                        thickness: 1,
                        color: Colors.grey.shade500,
                        indent: Sizes.size14,
                        endIndent: Sizes.size10,
                      ),
                      Column(
                        children: [
                          const Text(
                            "5M",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size18),
                          ),
                          Gaps.v3,
                          Text(
                            "followers",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                      Gaps.v14,
                      FractionallySizedBox(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Sizes.size4),
                            ),
                          ),
                          child: const Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Gaps.v14,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size32,
                        ),
                        child: Text(
                          "hi im imonkfcwifi!",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gaps.v14,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.link,
                            size: Sizes.size12,
                          ),
                          Gaps.h4,
                          Text(
                            "https://imonkfcwifi.com",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gaps.v5,
                        ],
                      ),
                      Gaps.v5,
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                                color: Colors.grey.shade100, width: 1),
                          ),
                        ),
                        child: const TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.symmetric(
                            vertical: Sizes.size10,
                          ),
                          indicatorColor: Colors.black,
                          labelColor: Colors.black,
                          tabs: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.size28),
                              child: Icon(
                                Icons.grid_4x4_rounded,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.size28),
                              child: FaIcon(
                                FontAwesomeIcons.heart,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
