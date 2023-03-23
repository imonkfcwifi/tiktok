import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile_model.dart';

// create profile
//  get profile
//  update profile , update bio <- challenge
class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> createProfile(UserProfileModel userProfile) async {
    await _db
        .collection("users")
        .doc(userProfile.uid)
        .set(userProfile.toJson());
  }
}

final userRepo = Provider((ref) => UserRepository());
