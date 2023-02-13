import 'package:flutter/widgets.dart';
import 'package:flutter_app/app/services/auth_service.dart';
import 'package:flutter_app/resources/pages/auth_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'controller.dart';

class HomeController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  logout() {
    routeTo(
      AuthPage.path,
      removeUntilPredicate: (route) => false,
    );
    AuthService.instance.logout();
  }
}
