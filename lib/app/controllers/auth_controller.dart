import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/app/services/auth_service.dart';
import '../../resources/pages/auth_page.dart';
import 'controller.dart';

class AuthController extends Controller {
  @override
  construct(BuildContext context) async {
    if (kIsWeb && !AuthService().hasSession) {
      var href = window.location.href;
      if (href.endsWith('/')) href = href.substring(0, href.length - 1);
      var path = href.substring(0, href.lastIndexOf('/')) + AuthPage.path;
      window.location.href = path;
    }

    super.construct(context);
  }
}
