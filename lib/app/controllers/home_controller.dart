import 'package:flutter_app/app/services/auth_service.dart';
import 'package:flutter_app/resources/pages/auth_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'controller.dart';

class HomeController extends Controller {
  logout() {
    routeTo(
      AuthPage.path,
      removeUntilPredicate: (route) => false,
    );
    AuthService.instance.logout();
  }
}
