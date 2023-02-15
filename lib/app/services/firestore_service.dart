import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:flutter_app/app/services/auth_service.dart';

class FirestoreService implements IDatabaseService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreService._internal();

  @override
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

  Future<void> updateUserLocation(GeoPoint location) async {
    var userId = AuthService().currentUser?.uid;
    if (userId != null) {
      await firestore
          .collection(FirestoreCollectionPath.dev.name)
          .doc(userId)
          .update({"location": location});
    }
  }
}

abstract class IDatabaseService {
  Future<void> writeUser();
}

enum FirestoreCollectionPath {
  dev,
}
