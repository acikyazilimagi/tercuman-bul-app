import 'package:flutter/material.dart';
import 'package:flutter_app/app/services/auth_service.dart';
import 'package:flutter_app/resources/pages/components_demo_page.dart';
import 'package:flutter_app/resources/pages/edit_translator_profile.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/pages/translator_list_page.dart';
import 'package:flutter_app/resources/pages/translator_profile_page.dart';
import 'package:nylo_support/router/models/base_arguments.dart';
import 'package:nylo_support/router/models/nyrouter_route_guard.dart';

import '../resources/pages/become_translator_page.dart';
import '/resources/pages/auth_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "flutter pub run nylo_framework:main make:page my_page"
| Learn more https://nylo.dev/docs/4.x/router
|--------------------------------------------------------------------------
*/

class AuthRouteGuard extends RouteGuard {
  final String route;
  AuthRouteGuard(this.route);

  @override
  Future<bool> canOpen(BuildContext? context, BaseArguments? args) {
    if (AuthService().hasSession) {
      return Future.value(true);
    }

    routeTo(AuthPage.path, data: {"redirectTo": route});
    return Future.value(false);
  }
}

class TranslatorRouteGuard extends RouteGuard {
  @override
  Future<bool> canOpen(BuildContext? context, BaseArguments? args) {
    if (AuthService().currentTranslator == null) {
      return Future.value(true);
    }

    routeTo(TranslatorListPage.path);
    return Future.value(false);
  }
}

appRouter() => nyRoutes((router) {
      router.route(HomePage.path, (context) => HomePage());
      router.route(AuthPage.path, (context) => AuthPage());
      router.route(ComponentsDemoPage.path, (context) => ComponentsDemoPage());
      router.route(
          BecomeTranslatorPage.path, (context) => BecomeTranslatorPage(),
          routeGuards: [
            AuthRouteGuard(BecomeTranslatorPage.path),
            TranslatorRouteGuard()
          ]);
      router.route(
          TranslatorProfilePage.path, (context) => TranslatorProfilePage(),
          routeGuards: [AuthRouteGuard(TranslatorProfilePage.path)]);
      router.route(EditTranslatorProfilePage.path,
          (context) => EditTranslatorProfilePage(),
          routeGuards: [AuthRouteGuard(EditTranslatorProfilePage.path)]);
      router.route(TranslatorListPage.path, (context) => TranslatorListPage(),
          routeGuards: [AuthRouteGuard(TranslatorListPage.path)]);
    });
