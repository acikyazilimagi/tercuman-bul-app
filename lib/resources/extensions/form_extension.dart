import 'package:nylo_framework/nylo_framework.dart';

extension FormExtension on NyState {
  String? validateEmail(String? email) {
    try {
      validator(rules: {
        "email address": "email"
      }, data: {
        "email address": email,
      }, alertStyle: ToastNotificationStyleType.DANGER);
      return null;
    } catch (e) {
      return "";
    }
  }
}
