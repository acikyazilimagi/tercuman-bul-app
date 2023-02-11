import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/translator.dart';
import '/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class TranslatorApiService extends BaseApiService {
  TranslatorApiService({BuildContext? buildContext}) : super(buildContext);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  DocumentSnapshot? docPagination;

  Future<List<Translator>> all() async {
    List<Translator> list = [];

    try {
      var collection = await FirebaseFirestore.instance
          .collection(getEnv('TRANSLATOR_DB'))
          .limit(10);

      if (null != docPagination) {
        collection.startAfterDocument(docPagination!);
      }

      var getDocs = await collection.get();

      var results = getDocs.docs;
      docPagination = results.last;
      results
          .forEach((element) => list.add(Translator.fromJson(element.data())));
    } catch (e) {}

    return list;
  }

  Future<String?> insert(Translator model) async {
    try {
      var collection =
          await FirebaseFirestore.instance.collection(getEnv('TRANSLATOR_DB'));

      DocumentReference data = await collection.add(model.toJson());

      return data.id;
    } catch (e) {
      return null;
    }
  }

  Future<bool> update(String docId, Translator model) async {
    var collection =
        await FirebaseFirestore.instance.collection(getEnv('TRANSLATOR_DB'));

    try {
      await collection.doc(docId).update(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(String docId) async {
    var collection =
        await FirebaseFirestore.instance.collection(getEnv('TRANSLATOR_DB'));

    try {
      await collection.doc(docId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Translator?> findOne({
    String? name,
    String? phone,
    String? email,
    String? facebook,
    String? instagram,
    String? messenger,
    String? language,
  }) async {
    var collection =
        await FirebaseFirestore.instance.collection(getEnv('TRANSLATOR_DB'));

    var findOne = collection;

    if (null != name && name.isNotEmpty) {
      findOne.where("name", isEqualTo: name);
    }

    if (null != phone && phone.isNotEmpty) {
      findOne.where("phone", isEqualTo: phone);
    }

    if (null != email && email.isNotEmpty) {
      findOne.where("email", isEqualTo: email);
    }

    if (null != facebook && facebook.isNotEmpty) {
      findOne.where("facebook", isEqualTo: facebook);
    }

    if (null != instagram && instagram.isNotEmpty) {
      findOne.where("instagram", isEqualTo: instagram);
    }

    if (null != messenger && messenger.isNotEmpty) {
      findOne.where("messenger", isEqualTo: messenger);
    }

    if (null != language && language.isNotEmpty) {
      findOne.where("languages", arrayContains: language);
    }

    findOne.limit(1);

    try {
      var results = await findOne.get();
      return Translator.fromJson(results.docs.first.data());
    } catch (e) {
      return null;
    }
  }

  Future<List<Translator>> find({
    String? name,
    String? phone,
    String? email,
    String? facebook,
    String? instagram,
    String? messenger,
    String? language,
    int? limits,
  }) async {
    var collection =
        await FirebaseFirestore.instance.collection(getEnv('TRANSLATOR_DB'));

    var findOne = collection;

    if (null != name && name.isNotEmpty) {
      findOne.where("name", isEqualTo: name);
    }

    if (null != phone && phone.isNotEmpty) {
      findOne.where("phone", isEqualTo: phone);
    }

    if (null != email && email.isNotEmpty) {
      findOne.where("email", isEqualTo: email);
    }

    if (null != facebook && facebook.isNotEmpty) {
      findOne.where("facebook", isEqualTo: facebook);
    }

    if (null != instagram && instagram.isNotEmpty) {
      findOne.where("instagram", isEqualTo: instagram);
    }

    if (null != messenger && messenger.isNotEmpty) {
      findOne.where("messenger", isEqualTo: messenger);
    }

    if (null != language && language.isNotEmpty) {
      findOne.where("languages", arrayContains: language);
    }

    if (null != limits && limits > 0) {
      findOne.limit(limits);
    }

    try {
      var results = await findOne.get();
      return results.docs
          .map((element) => Translator.fromJson(element.data()))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
