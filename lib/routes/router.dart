import 'package:flutter_app/resources/pages/home_page.dart';

import '/resources/pages/auth_page.dart';
import '/resources/pages/register_page.dart';
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

appRouter() => nyRoutes((router) {
      router.route(HomePage.path, (context) => HomePage());
      router.route(RegisterPage.path, (context) => RegisterPage());
      router.route(AuthPage.path, (context) => AuthPage());
    });
