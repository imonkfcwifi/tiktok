import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/users/repose/user_repo.dart';
import 'package:tiktok_clone/features/users/view_models/user_view_model.dart';

class AvatarViewModel extends AsyncNotifier<void> {
  late final UserRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(userRepo);
  }

  Future<void> uploadVatar(File file) async {
    state = const AsyncValue.loading();
    final fileName = ref.read(authRepo).user!.uid;
    state = await AsyncValue.guard(() async {
      await _repository.uploadAvatar(file, fileName);
      // data storage 에 저장
      await ref.read(userProvier.notifier).onAvatarUpload();
      // data model에도 알려주기
    });
  }
}

final avatarProvider = AsyncNotifierProvider<AvatarViewModel, void>(
  () => AvatarViewModel(),
);
