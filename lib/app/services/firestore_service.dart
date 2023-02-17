import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:flutter_app/app/services/auth_service.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreService._internal();

  Future<void> writeUser() async {
    final translator = AuthService().currentTranslator;

    if (translator.uuid != null) {
      try {
        //** Check user if exist */
        final isExist = await isUserExist(translator: translator);
        if (isExist) {
          return;
        }
        await firestore
            .collection(FirestoreCollectionPath.dev.name)
            .doc(translator.uuid)
            .set(translator.toJson());
      } catch (e) {
        print(e);
        log("Write user exception:", error: e);
      }
    }
  }

  Future<bool> isUserExist({required Translator translator}) async {
    final snapshot = await firestore
        .collection(FirestoreCollectionPath.dev.name)
        .doc(translator.uuid)
        .get();
    return snapshot.exists;
  }

  Future<void> updateLocation(GeoPoint location) async {
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
  }

  Future<void> getTranslator() async {
    var userId = AuthService().currentUser?.uid;
    if (userId != null) {
      var translator = await firestore
          .collection(FirestoreCollectionPath.dev.name)
          .doc(userId)
          .get();
      if(translator.exists) {
        AuthService().currentTranslator =
            Translator.fromJson(translator.data()!);
      }
    }
  }
}

enum FirestoreCollectionPath {
  dev,
}
