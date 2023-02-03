import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  void _increse() {
    setState(() {
      _clicks = _clicks + 1;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print(_clicks);
    super.dispose();
    // so we need to just make the screen disappear without kiliing the screen
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$_clicks",
            style: const TextStyle(fontSize: 28),
          ),
          TextButton(
            onPressed: _increse,
            child: const Text("+"),
          )
        ],
      ),
    );
  }
}
