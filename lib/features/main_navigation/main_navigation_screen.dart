import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/stf_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('data'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Offstage(
          offstage: _selectedIndex != 0,
          child: const StfScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 1,
          child: const StfScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 3,
          child: const StfScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 4,
          child: const StfScreen(),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTap(
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                text: 'Home',
                onTap: () => _onTap(0),
              ),
              NavTap(
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                isSelected: _selectedIndex == 1,
                text: 'Discover',
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTap(
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                isSelected: _selectedIndex == 3,
                text: 'Inbox',
                onTap: () => _onTap(3),
              ),
              NavTap(
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                isSelected: _selectedIndex == 4,
                text: 'Profile',
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
