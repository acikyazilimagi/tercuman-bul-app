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

  Future<List<Translator>> all() async {
    List<Translator> list = [];

    try {
      var collection = await FirebaseFirestore.instance
          .collection(getEnv('TRANSLATOR_DB'))
          .get();

      collection.docs
          .forEach((element) => list.add(Translator.fromJson(element.data())));
    } catch (e) {}

    return list;
  }

  insert() {}

  update() {}

  delete() {}

  findOne() {}

  find() {}
}
