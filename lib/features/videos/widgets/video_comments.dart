import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("27775 comments"),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            )
          ],
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => Gaps.v20,
          padding: const EdgeInsets.symmetric(
              vertical: Sizes.size10, horizontal: Sizes.size16),
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 18,
                child: Text("San'Te"),
              ),
              Gaps.h10,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size14,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Gaps.v3,
                  const Text("'a b c d e f g h"),
                ],
              )),
              Gaps.h10,
              Column(
                children: [
                  FaIcon(FontAwesomeIcons.heart,
                      size: Sizes.size20, color: Colors.grey.shade400),
                  Gaps.v2,
                  Text(
                    '52.1K',
                    style: TextStyle(color: Colors.grey.shade400),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.shade500,
                foregroundColor: Colors.white,
                child: const Text("user"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
