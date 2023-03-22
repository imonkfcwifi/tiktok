import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  @override
  FutureOr<UserProfileModel> build() {
    return UserProfileModel.empty();
  }

  Future<void> createAccount(UserCredential credential) async {
    state = AsyncValue.data(UserProfileModel(
        email: credential.user!.email ?? "?",
        bio: "?",
        link: "?",
        uid: credential.user!.uid,
        name: credential.user!.displayName ?? "??"));
  }
}

final userProvier = AsyncNotifierProvider(
  () => UsersViewModel(),
);
