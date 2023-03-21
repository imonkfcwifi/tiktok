import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// create profile
//  get profile
//  update profile , update bio <- challenge
class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> createProfile() async {}
}

final userRepo = Provider((ref) => UserRepository());
