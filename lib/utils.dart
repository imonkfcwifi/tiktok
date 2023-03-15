import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool isDartMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
      content: Text((error as FirebaseAuthException).message ?? "!"),
    ),
  );
}
