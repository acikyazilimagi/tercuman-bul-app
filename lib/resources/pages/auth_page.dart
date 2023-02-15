import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../widgets/molecules/main_scaffold.dart';
import '/app/controllers/controller.dart';

class AuthPage extends NyStatefulWidget {
  static const path = '/auth';

  final Controller controller = Controller();
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends NyState<AuthPage> {
  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SignInScreen(
        actions: [
          AuthStateChangeAction<SignedIn>(
            (context, state) {
              String route = widget.data(key: "redirectTo");
              routeTo(
                !route.isEmpty ? route : HomePage.path,
                removeUntilPredicate: (route) => false,
              );
            },
          ),
          AuthStateChangeAction<UserCreated>((context, state) {
            String route = widget.data(key: "redirectTo");
            routeTo(
              !route.isEmpty ? route : HomePage.path,
              removeUntilPredicate: (route) => false,
            );
          }),
        ],
      ),
    );
  }
}
