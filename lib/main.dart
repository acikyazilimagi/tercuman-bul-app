import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/bootstrap/app.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'bootstrap/boot.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase configuration
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Nylo Framework bootstrap
  Nylo nylo = await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);

  runApp(
    AppBuild(
      navigatorKey: NyNavigator.instance.router.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      debugShowCheckedModeBanner: false,
      initialRoute: nylo.initialRoute,
      builder: (context, widget) {
        return widget ?? SizedBox.shrink();
      },
    ),
  );
}
