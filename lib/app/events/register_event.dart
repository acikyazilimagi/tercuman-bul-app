import 'package:flutter_app/app/services/auth_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../models/translator.dart';

class RegisterEvent implements NyEvent {
  @override
  final listeners = {
    RegisterTranslatorListener: RegisterTranslatorListener(),
  };
}

/// Once this is called, the "currentTranslator" in AuthService is populated
class RegisterTranslatorListener extends NyListener {
  @override
  Future<void> handle(Map? event) async {
    AuthService authService = AuthService();
    var translator = authService.currentTranslator ?? Translator.empty();

    authService.currentTranslator = translator.copyWith(
      contact: translator.contact?.copyWith(
        phone: event?["phone"],
        email: authService.currentUser!.email,
        messenger: event?["messenger"],
        twitter: event?["twitter"],
        whatsapp: event?["whatsapp"],
        linkedin: event?["linkedin"],
      ),
      isInterpreter: true,
      name: event?["first_name"] + " " + event?["last_name"],
      languages: event?["languages"],
      capabilities: translator.capabilities?.copyWith(
        translatorInPerson: event?["on_site_support"],
        translatorVirtual: event?["digital_online_support"],
      ),
      uuid: authService.currentUser!.uid,
    );
  }
}
