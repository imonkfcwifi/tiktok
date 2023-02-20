import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: ListView(
          children: [
            Switch.adaptive(
              value: _notifications,
              onChanged: _onNotificationsChanged,
            ),
            CupertinoSwitch(
              value: _notifications,
              onChanged: _onNotificationsChanged,
            ),
            SwitchListTile.adaptive(
              activeColor: Colors.black,
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: const Text("click this"),
              subtitle: const Text("hi"),
            ),
            Checkbox(
              activeColor: Colors.black,
              checkColor: Colors.white,
              value: _notifications,
              onChanged: _onNotificationsChanged,
            ),
            CheckboxListTile(
              activeColor: Colors.black,
              checkColor: Colors.white,
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: const Text("Enable Noti"),
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                );
                print(date);
                final time = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                print(time);
                final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                          appBarTheme:
                              const AppBarTheme(foregroundColor: Colors.white),
                          backgroundColor: Colors.black),
                      child: child!,
                    );
                  },
                );
              },
              title: const Text(
                'what is your birthday',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: const Text('About this ap..'),
            ),
            ListTile(
                title: const Text(
                  "data (iOS) ",
                ),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("data"),
                      content: const Text("data2"),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("No"),
                        ),
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                }),
            ListTile(
                title: const Text(
                  "data (android) ",
                ),
                textColor: Colors.red,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("data"),
                      content: const Text("data2"),
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const FaIcon(FontAwesomeIcons.car),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                }),
            const AboutListTile()
          ],
        ));
  }
}
