import 'package:flutter_app/app/services/auth_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class RegisterEvent implements NyEvent {
  @override
  final listeners = {
    RegisterTranslatorListener: RegisterTranslatorListener(),
  };
}

class RegisterTranslatorListener extends NyListener {
  @override
  Future handle(Map? event) async {
    AuthService().currentTranslator = AuthService().currentTranslator.copyWith(
          contact: AuthService().currentTranslator.contact?.copyWith(
                facebook: event?["facebook"],
                twitter: event?["twitter"],
                instagram: event?["instagram"],
                linkedin: event?["linkedin"],
              ),
          name: event?["first_name"] + " " + event?["last_name"],
          languages: event?["languages"],
          capabilities: AuthService().currentTranslator.capabilities?.copyWith(
                translatorInPerson: event?["on_site_support"],
                translatorVirtual: event?["digital_online_support"],
              ),
        );
  }
}
