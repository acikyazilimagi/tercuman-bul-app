import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/services/auth_service.dart';
import '/bootstrap/app.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'app/models/languages.dart';
import 'bootstrap/boot.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Nylo Framework bootstrap
  Nylo nylo = await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  if(AuthService().hasSession) {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('notification settings ${settings.toString()}');

    if(settings.authorizationStatus != AuthorizationStatus.denied) {
      final fcmToken = await FirebaseMessaging.instance.getToken(
          vapidKey: "BM6l5fsHPKyO8XNC1nXlGtdUJ6gDz3hGSF_lrLwmOUQNcRCRFK2EDtjec3BMDh-cKzoAvNeZURaOSlpgWJ8u7iI");
      print('fcm token $fcmToken');
    }
  }

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
