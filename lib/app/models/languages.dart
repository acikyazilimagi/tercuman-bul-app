import 'package:diacritic/diacritic.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

class Languages {
  static final Languages _singleton = Languages._();
  static List<MapEntry<String, String>>? _languageData;

  factory Languages(BuildContext context) {
    _languageData = LocaleNames.of(context)!
        .sortedByName
        .where(_filterTwoLetterCodes)
        .toList();
    _languageData!.add(MapEntry("ku", "Kurdish"));
    _languageData!.sort(_sortDiacritics);
    return _singleton;
  }

  Languages._();

  static final Set<String> _appLanguages = {"en", "tr", "ar", "ku", "ru"};

  static final _sortDiacritics =
      (a, b) => removeDiacritics(a.value).compareTo(removeDiacritics(b.value));

  static final _filterTwoLetterCodes = (e) => e.key.length == 2;

  static final _filterAppLanguages = (e) => _appLanguages.contains(e.key);

  static List<MapEntry<String, String>> get appLanguages {
    return _languageData!.where(_filterAppLanguages).toList();
  }

  static String nativeLocaleName(String languageCode) => languageCode == "ku"
      ? "Kurdî"
      : LocaleNamesLocalizationsDelegate.nativeLocaleNames.entries
          .firstWhere((e) => e.key == languageCode)
          .value;

  static List<MapEntry<String, String>> get usableLanguages {
    return _languageData!;
  }
}
