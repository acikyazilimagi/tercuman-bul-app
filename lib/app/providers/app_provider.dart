import 'package:flutter_app/app/services/auth_service.dart';
import 'package:flutter_app/config/design.dart';
import 'package:flutter_app/config/theme.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/localization.dart';
import '../services/firestore_service.dart';

class AppProvider implements NyProvider {
  @override
  boot(Nylo nylo) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await NyLocalization.instance.init(
        localeType: localeType,
        languageCode: prefs.getString("appLanguage") ?? languageCode,
        languagesList: languagesList,
        assetsDirectory: assetsDirectory,
        valuesAsMap: valuesAsMap);

    nylo.initialRoute = HomePage.path;
    nylo.appLoader = loader;
    nylo.appLogo = logo;
    nylo.appThemes = appThemes;

    AuthService().configureProviders();
    await FirestoreService().getTranslator();

    return nylo;
  }
}
