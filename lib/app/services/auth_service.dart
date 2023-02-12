import 'dart:developer';

import 'package:firebase_ui_auth/firebase_ui_auth.dart' as uiAuth;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart' as oAuthGoogle;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:flutter_app/resources/extensions/translator_extension.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthService implements ISocialAuth {
  static final AuthService instance = AuthService._internal();
  Translator currentTranslator = Translator.empty(languages: ["tr"]);

  factory AuthService() => instance;

  AuthService._internal();

  User? get currentUser => FirebaseAuth.instance.currentUser;

  bool get hasSession => currentUser != null;

  void configureProviders() {
    uiAuth.FirebaseUIAuth.configureProviders([
      uiAuth.EmailAuthProvider(),
      oAuthGoogle.GoogleProvider(clientId: getEnv('GOOGLE_CLIENT_ID') ?? ''),
    ]);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      final firebaseCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      currentTranslator = currentTranslator.toTranslator(user: firebaseCredential.user);
    } catch (e) {
      log("Auth error: ", error: e);
    }
  }
}

abstract class ISocialAuth {
  Future<void> signInWithGoogle();
}
