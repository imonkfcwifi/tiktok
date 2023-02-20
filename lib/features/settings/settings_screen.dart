import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: ListWheelScrollView(
          useMagnifier: true,
          itemExtent: 200,
          diameterRatio: 1.5,
          offAxisFraction: 1.5,
          children: [
            for (var x in [
              1,
              2,
              3,
              4,
              5,
              6,
            ])
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  color: Colors.teal,
                  alignment: Alignment.center,
                  child: const Text(
                    'pick me',
                    style: TextStyle(color: Colors.white, fontSize: 39),
                  ),
                ),
              )
          ]),
    );
  }
}
