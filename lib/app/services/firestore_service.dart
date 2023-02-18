import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:flutter_app/app/services/auth_service.dart';

import 'location_service.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreService._internal();

  Future<void> getTranslator() async {
    try {
      var userId = AuthService().currentUser?.uid;
      if (userId == null) return;

      var translator = await firestore
          .collection(FirestoreCollectionPath.dev.name)
          .doc(userId)
          .get();
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
      if (translator == null) return;

      var userId = AuthService().currentUser?.uid;
      if (userId == null) return;

      await firestore
          .collection(FirestoreCollectionPath.dev.name)
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
          .collection(FirestoreCollectionPath.dev.name)
          .doc(userId)
          .update(translator.toJson());
    } catch (e) {
      log("Update translator exception:", error: e);
    }
  }

  Future<void> updateLocation(GeoPoint location) async {
    try {
      var userId = AuthService().currentUser?.uid;
      // TODO: Reports error due to cloud_firestore 4.4.0, fix is pending PR
      // See https://github.com/firebase/flutterfire/issues/10451
      log("updateLocation userId ${userId}, geo ${location}");
      if (userId != null) {
        await firestore
            .collection(FirestoreCollectionPath.dev.name)
            .doc(userId)
            .update({"location": location});
      }
    } catch (e) {
      log("Update location exception:", error: e);
    }
  }
}

enum FirestoreCollectionPath {
  dev,
}
