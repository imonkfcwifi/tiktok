import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});
// consumerwidget is coming from riverpod
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // riverpod을 사용하기 위한 WidgetRef
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              activeColor: Colors.black,
              value: ref.watch(playbackConfigProvider).muted,
              // 변경사항을 watch , 변하는 property의 값을 알고싶을때
              onChanged: (value) {
                ref.read(playbackConfigProvider.notifier).setMuted(value);
                // notifier class에 접근
              },
              // 변경사항을 change, 주로 Method
              title: const Text("click this"),
              subtitle: const Text("hi"),
            ),
            SwitchListTile.adaptive(
              activeColor: Colors.black,
              value: ref.watch(playbackConfigProvider).autoplay,
              // 변경사항을 watch , 변하는 property의 값을 알고싶을때
              onChanged: (value) {
                ref.read(playbackConfigProvider.notifier).setAutoplay(value);
              },
              // 변경사항을 change, 주로 Method
              title: const Text("click this"),
              subtitle: const Text("hi"),
            ),
            Switch.adaptive(
              value: false,
              onChanged: (value) {},
            ),
            CupertinoSwitch(
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile.adaptive(
              activeColor: Colors.black,
              value: false,
              onChanged: (value) {},
              title: const Text("click this"),
              subtitle: const Text("hi"),
            ),
            Checkbox(
              activeColor: Colors.black,
              checkColor: Colors.white,
              value: false,
              onChanged: (value) {},
            ),
            CheckboxListTile(
              activeColor: Colors.black,
              checkColor: Colors.white,
              value: false,
              onChanged: (value) {},
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

                final time = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());

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
            ListTile(
                title: const Text(
                  "data (ios. buttom) ",
                ),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      message: const Text("data2"),
                      title: const Text("data"),
                      actions: [
                        CupertinoActionSheetAction(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Not Log Out")),
                        CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("yes"))
                      ],
                    ),
                  );
                }),
            const AboutListTile()
          ],
        ));
  }
}
