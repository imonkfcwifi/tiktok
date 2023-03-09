import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/utils.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import 'apple_screen.dart';
import 'login_screen.dart';
import 'username_screen.dart';
import 'widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  static const routeURL = "/";
  static const routeName = "signUp";
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    context.pushNamed(LoginScreen.routeName);
    // context.go 는 stack 무시하고 location 으로 이동
  }

  void onEmailTap(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const UsernameScreen()));
  }

  void onAppleTap(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
/*         if (orientation == Orientation.landscape) {
          return const Scaffold(
            body: Center(child: Text("Please Rotate your phone")),
          );
        } */

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gaps.v80,
                  Text("Sign up for TikTok",
                      style: Theme.of(context).textTheme.headlineSmall),
                  Gaps.v20,
                  const Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Create a profile, follow other accounts, make your own videos, and more.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    const AuthButton(
                      icon: FaIcon(FontAwesomeIcons.solidUser),
                      text: "Use Email & Password",
                      button: UsernameScreen(),
                    ),
                    Gaps.v16,
                    const AuthButton(
                      icon: FaIcon(FontAwesomeIcons.apple),
                      text: "Continue with Apple",
                      button: AppleScreen(),
                    ),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: const [
                        Expanded(
                          child: AuthButton(
                            icon: FaIcon(FontAwesomeIcons.solidUser),
                            text: "Use Email & Password",
                            button: UsernameScreen(),
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: AuthButton(
                            icon: FaIcon(FontAwesomeIcons.apple),
                            text: "Continue with Apple",
                            button: AppleScreen(),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: isDartMode(context) ? Colors.grey.shade900 : Colors.black45,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
