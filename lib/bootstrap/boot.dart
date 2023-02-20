import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../config/providers.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// Boot methods for Nylo.
class Boot {
  static Future<Nylo> nylo() async {
    const envPath = String.fromEnvironment('ENV_FILE_PATH', defaultValue: 'dotenv');
    await dotenv.load(fileName: envPath);
    return await bootApplication(providers);
  }
  static Future<void> finished(Nylo nylo) async => await bootFinished(nylo);
}
