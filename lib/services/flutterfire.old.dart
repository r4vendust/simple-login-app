import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

// listen to auth changes

// Login with email & password

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    debugPrint(FirebaseAuth.instance.currentUser.toString());
    debugPrint('Email: ${FirebaseAuth.instance.currentUser?.email.toString()}');
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      debugPrint('No user found for that email');
    } else if (e.code == 'wrong-password') {
      debugPrint('Wrong passowrd provided for that user');
    }
    debugPrint(e.toString());
    debugPrint('Sign in returned false');
    return false;
  }
}

// Register with email & password

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak');
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email');
    }
    return false;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

// Verify users email

// Sign out

Future signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    debugPrint('Signed out');
  } catch(e) {
    debugPrint(e.toString());
  }
}