import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';
import 'package:tiktok_clone/features/users/repose/user_repo.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _userRepository;
  late final AuthenticationRepository _authenticationRepository;
  @override
  FutureOr<UserProfileModel> build() async {
    _userRepository = ref.read(userRepo);
    _authenticationRepository = ref.read(authRepo);
    if (_authenticationRepository.isLoggedIn) {
      final profile = await _userRepository
          .findProfile(_authenticationRepository.user!.uid);
      if (profile != null) {
        return UserProfileModel.fromjson(profile);
      }
    }
    return UserProfileModel.empty();
  }

// sign up 시 firestore에도 계정 저장
  Future<void> createAccount(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception("no");
    }
    state = const AsyncValue.loading();
    final profile = UserProfileModel(
        email: credential.user!.email ?? "?",
        bio: "?",
        link: "?",
        uid: credential.user!.uid,
        name: credential.user!.displayName ?? "??");
    await _userRepository.createProfile(profile);
    state = AsyncValue.data(profile);
  }
}

final userProvier = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
