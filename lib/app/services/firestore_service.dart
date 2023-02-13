import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
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
        final snapshot = await firestore.collection(FirestoreCollectionPath.dev.name).doc(translator.uuid).get();
        if (snapshot.exists) {
          return;
        }
        await firestore.collection(FirestoreCollectionPath.dev.name).doc(translator.uuid).set(translator.toJson());
      } catch (e) {
        print(e);
        log("Write user exception:", error: e);
      }
    }
  }
}

abstract class IDatabaseService {
  Future<void> writeUser();
}

enum FirestoreCollectionPath {
  dev,
}
