import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/features/videos/repos/video_playback_repo.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/router.dart';

import 'constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  // repository는 preferences를 넘겨줘야만 들을 수 있음
  final preferences = await SharedPreferences.getInstance();
  // SharedPrefernces 접근
  final repository = PlaybackConfigRepository(preferences);
  // Repository initialize
  runApp(
    ProviderScope(
      overrides: [
        playbackConfigProvider
            .overrideWith(() => PlaybackConfigViewModel(repository))
      ],
      child: const TikTokApp(),
    ),
  );
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clonegit init',
      themeMode: ThemeMode.system,
      theme: ThemeData(
          tabBarTheme: TabBarTheme(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
          ),
          indicatorColor: Colors.black,
          brightness: Brightness.light,
          textTheme: Typography.blackCupertino,
          splashColor: Colors.transparent,
          primaryColor: const Color(0xFFE9435A),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Color(0xFFE9435A)),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          listTileTheme: const ListTileThemeData(iconColor: Colors.black)),
      darkTheme: ThemeData(
        indicatorColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900),
        textTheme: Typography.whiteCupertino,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFE9435A),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade900),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Color(0xFFE9435A)),
      ),
    );
  }
}
