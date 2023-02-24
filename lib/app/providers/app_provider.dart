import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/app/services/auth_service.dart';
import 'package:flutter_app/config/design.dart';
import 'package:flutter_app/config/theme.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../config/localization.dart';
import '../services/firestore_service.dart';
import '../services/location_service.dart';
import '../services/shared_preferences_service.dart';

class AppProvider implements NyProvider {
  @override
  boot(Nylo nylo) async {
    final prefs = await SharedPreferencesService.getInstance();
    final locale = await prefs.getLanguage();

    await NyLocalization.instance.init(
        localeType: localeType,
        languageCode: locale,
        languagesList: languagesList,
        assetsDirectory: assetsDirectory,
        valuesAsMap: valuesAsMap);

    nylo.initialRoute = HomePage.path;
    nylo.appLoader = loader;
    nylo.appLogo = logo;
    nylo.appThemes = appThemes;

    // Firebase configuration
    await Firebase.initializeApp(options: DefaultFirebaseOptions().currentPlatform);

    AuthService().configureProviders();
    await FirestoreService().getTranslator();
    LocationService();
    return nylo;
  }
}
