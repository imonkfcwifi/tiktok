import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/widgets/video_configuration/video_confug.dart';
import 'package:tiktok_clone/router.dart';

import 'constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.dark,
  // );
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VideoConfig(),
        )
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
