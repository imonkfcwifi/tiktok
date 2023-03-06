import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_creen.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = "chats";
  static const String routeURL = "/chats";

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  void _onPressedPlus() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(_items.length);
      _items.add(_items.length);
    }
  }
// AnimatedListState에 접근

  final List<int> _items = [];

  final Duration _duration = const Duration(milliseconds: 300);

  void _deletePress(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: _makeTile(index),
        ),
        duration: _duration,
      );
      _items.remove(index);
    }
  }

  void _onChatTap(int index) {
    context.pushNamed(ChatDetailScreen.routeName, params: {"chatId": "$index"});
  }

  Widget _makeTile(int index) {
    return ListTile(
      onTap: () => _onChatTap(index),
      onLongPress: () => _deletePress(index),
      leading: const CircleAvatar(
        foregroundImage: NetworkImage(
          "https://avatars.githubusercontent.com/u/110550852?v=4",
        ),
        radius: 25,
        child: Text('ksante'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'username ($index)',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '2:38PM',
            style:
                TextStyle(color: Colors.grey.shade500, fontSize: Sizes.size12),
          ),
        ],
      ),
      subtitle: const Text('Hey~!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Direct Messages'),
        actions: [
          IconButton(
            onPressed: _onPressedPlus,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          )
        ],
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child:
                SizeTransition(sizeFactor: animation, child: _makeTile(index)),
          );
        },
      ),
    );
  }
}
