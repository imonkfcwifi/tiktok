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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$_clicks"),
        TextButton(
          onPressed: _increse,
          child: const Text("+"),
        )
      ],
    );
  }
}
