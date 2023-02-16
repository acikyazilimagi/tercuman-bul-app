import 'dart:developer';

import 'package:firebase_ui_auth/firebase_ui_auth.dart' as uiAuth;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart' as oAuthGoogle;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  Translator currentTranslator = Translator.empty();

  factory AuthService() => instance;

  AuthService._internal();

  User? get currentUser => FirebaseAuth.instance.currentUser;

  bool get hasSession => currentUser != null;

  void configureProviders() {
    uiAuth.FirebaseUIAuth.configureProviders([
      uiAuth.EmailAuthProvider(),
      oAuthGoogle.GoogleProvider(clientId: getEnv('GOOGLE_CLIENT_ID') ?? ''),
    ]);

    currentTranslator = currentTranslator.copyWith(uuid: currentUser?.uid);
  }

  Future<void> logout() async {
    log('signing out ${currentUser.toString()}');
    await FirebaseAuth.instance.signOut();
    log('signed out ${currentUser.toString()}');
  }
}
