import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () => showAboutDialog(
                  context: context,
                  applicationVersion: "1.0",
                  applicationLegalese:
                      "All rightts reserved. Please dont copy me."),
              title: const Text(
                'data',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: const Text('About this ap..'),
            ),
            const AboutListTile()
          ],
        ));
  }
}
