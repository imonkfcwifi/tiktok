import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/users/view_models/user_view_model.dart';

import '../../../utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signupForm);
    final users = ref.read(userProvier.notifier);
    state = await AsyncValue.guard(() async {
      final userCredential = await _repository.emailSignUp(
        form["email"],
        form["password"],
      );

      await users.createAccount(userCredential);
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.goNamed(InterestScreen.routeName);
    }
  }
}

// StateProvider : 바깥에서 수정할 수 있는 value를 expose
final signupForm = StateProvider((ref) => {});

final signUpProvider =
    AsyncNotifierProvider<SignUpViewModel, void>(() => SignUpViewModel());
