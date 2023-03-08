import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'common/widgets/main_navigation/main_navigation_screen.dart';
import 'features/authentication/login_screen.dart';
import 'features/authentication/sign_up_screen.dart';
import 'features/inbox/activity_screen.dart';
import 'features/inbox/chat_detail_creen.dart';
import 'features/inbox/chats_screen.dart';
import 'features/onboarding/interests_screen.dart';
import 'features/videos/views/video_recording_screen.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestScreen.routeName,
      path: InterestScreen.routURL,
      builder: (context, state) => const InterestScreen(),
    ),
    GoRoute(
      name: MainNavigationScreen.routeName,
      path: "/:tab(home|discover|inbox|profile)",
      builder: (context, state) {
        final tabs = state.params["tab"]!;
        return MainNavigationScreen(tab: tabs);
      },
    ),
    GoRoute(
      name: ActivityScreen.routeName,
      path: ActivityScreen.routeURL,
      builder: (context, state) {
        return const ActivityScreen();
      },
    ),
    GoRoute(
      name: ChatScreen.routeName,
      path: ChatScreen.routeURL,
      builder: (context, state) => const ChatScreen(),
      routes: [
        GoRoute(
            path: ChatDetailScreen.routeURL,
            name: ChatDetailScreen.routeURL,
            builder: (context, state) {
              final id = state.params["id"]!;
              return ChatDetailScreen(chatId: id);
            })
      ],
    ),
    GoRoute(
      path: VideoRecordingScreen.routeURL,
      name: VideoRecordingScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        child: const VideoRecordingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final position = Tween(begin: const Offset(0, 1), end: Offset.zero)
              .animate(animation);
          return SlideTransition(position: position, child: child);
        },
      ),
    ),
  ],
);
