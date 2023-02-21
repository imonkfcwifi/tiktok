import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clonegit init',
      theme: ThemeData(
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
      ),
      home: const LayoutBuilderCodeLab(),
    );
  }
}

class LayoutBuilderCodeLab extends StatelessWidget {
  const LayoutBuilderCodeLab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        // 어디에 layout을 두드냐에 따라 layoutBuilder는 mediaquery의 size와 다른값을 나타낸다.
        // screen size와 father size와 관계없음
        builder: (context, constraints) => Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: Colors.teal,
          child: Center(
            child: Text(
              "${constraints.maxWidth} / ${size.width}",
              style: const TextStyle(color: Colors.white, fontSize: 98),
            ),
          ),
        ),
      ),
    );
  }
}
