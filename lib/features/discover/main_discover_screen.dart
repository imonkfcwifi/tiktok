import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('discover'),
          bottom: TabBar(
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            tabs: const [
              Tab(
                text: "Top",
              ),
              Tab(
                text: "Top",
              ),
              Tab(
                text: "Top",
              ),
              Tab(
                text: "Top",
              )
            ],
          ),
        ),
      ),
    );
  }
}
