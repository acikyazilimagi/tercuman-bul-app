import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/translator_list_item.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| ApiService
| -------------------------------------------------------------------------
| Define your API endpoints

| Learn more https://nylo.dev/docs/4.x/networking
|--------------------------------------------------------------------------
*/

class ApiService extends BaseApiService {
  ApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  get interceptors =>
      {if (getEnv('APP_DEBUG') == true) PrettyDioLogger: PrettyDioLogger()};

  Future<List<TranslatorListItem>> fetchTestData() async {
    String token = await FirebaseAuth.instance.currentUser!.getIdToken();
    return await network(
      request: (request) {
        request.options.headers = {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        };
        return request.post("/getUsersByLocation",
            data: jsonEncode({
              "latitude": 66.22248,
              "longitude": 50.94119,
              "page": 1,
              "env": "dev"
            }));
      },
      handleFailure: (e) {
        log(e.toString());
      },
    );
  }
}
