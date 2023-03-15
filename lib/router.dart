import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';

import 'common/widgets/main_navigation/main_navigation_screen.dart';
import 'features/authentication/login_screen.dart';
import 'features/authentication/sign_up_screen.dart';
import 'features/inbox/activity_screen.dart';
import 'features/inbox/chat_detail_creen.dart';
import 'features/inbox/chats_screen.dart';
import 'features/onboarding/interests_screen.dart';
import 'features/videos/views/video_recording_screen.dart';

final routerProvider = Provider((ref) {
  // ref.watch(authStateStream);
  // authstate 가 바뀌고 state가 변경되면 rebuil 되고 자동으로 rediret 됨
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.subloc != SignUpScreen.routeURL &&
            state.subloc != LoginScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },
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
        path: "/:tab(home|discover|inbox|profile)",
        name: MainNavigationScreen.routeName,
        builder: (context, state) {
          final tab = state.params["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),
      GoRoute(
        name: ActivityScreen.routeName,
        path: ActivityScreen.routeURL,
        builder: (context, state) => const ActivityScreen(),
      ),
      GoRoute(
        name: ChatScreen.routeName,
        path: ChatScreen.routeURL,
        builder: (context, state) => const ChatScreen(),
        routes: [
          GoRoute(
            name: ChatDetailScreen.routeName,
            path: ChatDetailScreen.routeURL,
            builder: (context, state) {
              final chatId = state.params["chatId"]!;
              return ChatDetailScreen(
                chatId: chatId,
              );
            },
          )
        ],
      ),
      GoRoute(
        path: VideoRecordingScreen.routeURL,
        name: VideoRecordingScreen.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 200),
          child: const VideoRecordingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final position = Tween(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation);
            return SlideTransition(
              position: position,
              child: child,
            );
          },
        ),
      )
    ],
  );
});
