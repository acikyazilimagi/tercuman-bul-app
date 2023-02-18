import 'package:firebase_ui_auth/firebase_ui_auth.dart' as ui_auth;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart'
    as oauth_google;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  Translator? currentTranslator;
  factory AuthService() => instance;

  AuthService._internal();

  User? get currentUser => FirebaseAuth.instance.currentUser;

  bool get hasSession => currentUser != null;

  void configureProviders() {
    ui_auth.FirebaseUIAuth.configureProviders([
      ui_auth.EmailAuthProvider(),
      oauth_google.GoogleProvider(clientId: getEnv('GOOGLE_CLIENT_ID') ?? ''),
    ]);
  }

  Future<void> logout() async {
    currentTranslator = null;
    await FirebaseAuth.instance.signOut();
  }
}
