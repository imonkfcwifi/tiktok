import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile_model.dart';

// create profile
//  get profile
//  update profile , update bio <- challenge
class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createProfile(UserProfileModel userProfile) async {
    await _db
        .collection("users")
        .doc(userProfile.uid)
        .set(userProfile.toJson());
  }

  Future<Map<String, dynamic>?> findProfile(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();
    return doc.data();
  }

  Future<void> uploadAvatar(File file, String fileName) async {
    final fileRef = _storage.ref().child("avatars/$fileName");
    final task = await fileRef.putFile(file);
  }
}

final userRepo = Provider((ref) => UserRepository());
