import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTap(
                icon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                text: 'Home',
                onTap: () => _onTap(0),
              ),
              NavTap(
                icon: FontAwesomeIcons.magnifyingGlass,
                isSelected: _selectedIndex == 1,
                text: 'Discover',
                onTap: () => _onTap(1),
              ),
              NavTap(
                icon: FontAwesomeIcons.message,
                isSelected: _selectedIndex == 3,
                text: 'Inbox',
                onTap: () => _onTap(3),
              ),
              NavTap(
                icon: FontAwesomeIcons.user,
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
