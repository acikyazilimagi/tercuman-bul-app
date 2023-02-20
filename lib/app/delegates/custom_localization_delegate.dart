import 'package:flutter/material.dart';

import '../../config/localization.dart';

class CustomLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) =>
      languagesList.contains(locale.languageCode);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      const DefaultMaterialLocalizations();

  @override
  bool shouldReload(_) => false;
}
