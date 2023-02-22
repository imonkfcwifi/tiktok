import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';

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
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.raleway(
              fontSize: 99, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          displayMedium: GoogleFonts.raleway(
              fontSize: 62, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          displaySmall:
              GoogleFonts.raleway(fontSize: 49, fontWeight: FontWeight.w400),
          headlineMedium: GoogleFonts.raleway(
              fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headlineSmall:
              GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.w400),
          titleLarge: GoogleFonts.raleway(
              fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          titleMedium: GoogleFonts.raleway(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          titleSmall: GoogleFonts.raleway(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyLarge: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyMedium: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          labelLarge: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          bodySmall: GoogleFonts.roboto(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          labelSmall: GoogleFonts.roboto(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
        // 이제 textstyle을 줄때 (app 첫 구상시) 위와 같은 구성으로 맞추는게 편할듯
        // we dont need to think about sizes
        // property 넣고싶을때 ex ) !.copyWith(color:Colors.red)
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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFE9435A),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade900),
      ),
      home: const SignUpScreen(),
    );
  }
}
