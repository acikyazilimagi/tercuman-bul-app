import 'package:flutter_app/app/services/auth_service.dart';
import 'package:flutter_app/config/design.dart';
import 'package:flutter_app/config/theme.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../config/localization.dart';

class AppProvider implements NyProvider {
  boot(Nylo nylo) async {
    await NyLocalization.instance.init(
        localeType: localeType,
        languageCode: languageCode,
        languagesList: languagesList,
        assetsDirectory: assetsDirectory,
        valuesAsMap: valuesAsMap);

    nylo.initialRoute = HomePage.path;
    nylo.appLoader = loader;
    nylo.appLogo = logo;
    nylo.appThemes = appThemes;

    AuthService().configureProviders();

    return nylo;
  }
}
