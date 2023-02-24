import 'package:flutter/material.dart';
import '/bootstrap/app.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'app/models/languages.dart';
import 'bootstrap/boot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Nylo Framework bootstrap
  Nylo nylo = await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);

  runApp(
    AppBuild(
      navigatorKey: NyNavigator.instance.router.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      debugShowCheckedModeBanner: false,
      initialRoute: nylo.initialRoute,
      builder: (context, widget) {
        Languages(context);
        return widget ?? const SizedBox.shrink();
      },
      themeData: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(20),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontSize: 19),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
    ),
  );
}
