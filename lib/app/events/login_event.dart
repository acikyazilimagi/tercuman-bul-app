import 'dart:developer';

import 'package:flutter_app/app/models/translator.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoginEvent implements NyEvent {
  @override
  final listeners = {
    DefaultListener: DefaultListener(),
    AuthTranslatorListener: AuthTranslatorListener(),
  };
}

class DefaultListener extends NyListener {
  @override
  handle(dynamic event) async {
    // handle the payload from event
  }
}

class AuthTranslatorListener extends NyListener {
  @override
  handle(dynamic event) async {
    final translator = event["auth_translator"] as Translator;
    log("Welcome translator: ${translator.toJson().toString()}");
  }
}
