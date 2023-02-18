import 'package:flutter_app/app/models/translator.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;

extension FirebaseUserToTranslator on Translator {
  Translator toTranslator({User? user}) {
    return copyWith(
      uuid: user?.uid,
      contact: contact?.copyWith(email: user?.email),
      name: user?.displayName ?? "",
    );
  }
}
