import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _textController = TextEditingController(text: '');
  bool _isWriting = false;
  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  final List<String> _list = [];

  void _chatOn() {
    final String chat = _textController.text;
    if (chat.isNotEmpty) {
      _list.add(chat);
      _textController.clear();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: GestureDetector(
        onTap: _stopWriting,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size10,
          leading: Stack(
            children: const [
              CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/3612017"),
                child: Text("kfc"),
              ),
            ],
          ),
          title: const Text(
            "im on kfc wifi",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: const Text("Active now"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      )),
      body: GestureDetector(
        onTap: _stopWriting,
        child: Stack(
          children: [
            ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size14,
                ),
                itemBuilder: (context, index) {
                  final chatMessage = _list[index];
                  final isMine = index % 2 == 0;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Sizes.size14),
                        decoration: BoxDecoration(
                          color: isMine
                              ? Colors.grey
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(Sizes.size20),
                            topRight: const Radius.circular(Sizes.size20),
                            bottomLeft: Radius.circular(
                                isMine ? Sizes.size20 : Sizes.size5),
                            bottomRight: Radius.circular(
                                !isMine ? Sizes.size20 : Sizes.size5),
                          ),
                        ),
                        child: Text(
                          chatMessage,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: _list.length),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.black,
                              size: Sizes.size28,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Send a message . . .",
                          ),
                          onChanged: (text) {
                            if (text.isNotEmpty && !_isWriting) {
                              _onStartWriting();
                            } else if (text.isEmpty && _isWriting) {
                              _stopWriting();
                            }
                          },
                        ),
                      ),
                      Gaps.h20,
                      IconButton(
                        onPressed: _chatOn,
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size10),
                        icon: const FaIcon(
                          FontAwesomeIcons.paperPlane,
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
