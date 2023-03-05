import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:flutter_app/app/services/auth_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import 'location_service.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();

  factory FirestoreService() => _instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreService._internal();

  Future<void> getTranslator() async {
    try {
      var userId = AuthService().currentUser?.uid;
      if (userId == null) {
        return;
      }

      var translator =
          await firestore.collection(getEnv('TRANSLATOR_DB')).doc(userId).get();
      if (translator.exists) {
        AuthService().currentTranslator =
            Translator.fromJson(translator.data()!);
      }
    } catch (e) {
      log("Get translator exception:", error: e);
    }
  }

  Future<void> createTranslator() async {
    try {
      var translator = AuthService().currentTranslator;
      if (translator == null) {
        return;
      }

      var userId = AuthService().currentUser?.uid;
      if (userId == null) {
        return;
      }

      await firestore
          .collection(getEnv('TRANSLATOR_DB'))
          .doc(userId)
          .set(translator.toJson());

      await LocationService().updateLocation();
    } catch (e) {
      log("Create translator exception:", error: e);
    }
  }

  Future<void> updateTranslator() async {
    try {
      var translator = AuthService().currentTranslator;
      if (translator == null) return;

      var userId = AuthService().currentUser?.uid;
      if (userId == null) return;

      await firestore
          .collection(getEnv('TRANSLATOR_DB'))
          .doc(userId)
          .update(translator.toJson());
    } catch (e) {
      log("Update translator exception:", error: e);
    }
  }

  Future<void> updateLocation(GeoPoint location) async {
    try {
      var userId = AuthService().currentUser?.uid;
      if (userId != null) {
        await firestore
            .collection(getEnv('TRANSLATOR_DB'))
            .doc(userId)
            .set({"location": location}, SetOptions(merge: true));
      }
    } catch (e) {
      log("Update location exception: ${e.toString()}");
    }
  }

  Future<void> requestHelp(String uid) async {
    try {
      var userId = AuthService().currentUser?.uid;
      if (userId != null) {
        await firestore
            .collection("${getEnv('TRANSLATOR_DB')}Notifications")
            .doc(uid)
            .set({"sender": userId, "fcm": "fcm-t"});
      }
    } catch (e) {
      log("Failed to request help: ${e.toString()}");
    }
  }

  updateFcmToken() async {
    if (AuthService().hasSession) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus != AuthorizationStatus.denied) {
        final fcmToken = await FirebaseMessaging.instance.getToken(
            vapidKey:
                "BM6l5fsHPKyO8XNC1nXlGtdUJ6gDz3hGSF_lrLwmOUQNcRCRFK2EDtjec3BMDh-cKzoAvNeZURaOSlpgWJ8u7iI");
        await firestore
            .collection("${getEnv('TRANSLATOR_DB')}FcmTokens")
            .doc(AuthService().currentUser?.uid)
            .set({
          "tokens": {
            fcmToken: FieldValue.serverTimestamp(),
          }
        }, SetOptions(merge: true));
      }
    }
  }
}
