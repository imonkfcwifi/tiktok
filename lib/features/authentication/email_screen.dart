import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Gaps.v40,
            Text(
              "Crete Username",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v8,
            Text(
              "You can always change this later",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}