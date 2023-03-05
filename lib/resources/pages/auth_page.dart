import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/services/firestore_service.dart';
import 'package:flutter_app/app/services/shared_preferences_service.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/widgets/atoms/terms_and_conditions.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../widgets/molecules/main_scaffold.dart';
import '/app/controllers/controller.dart';

class AuthPage extends NyStatefulWidget {
  static const path = '/auth';

  @override
  get controller => Controller();

  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends NyState<AuthPage> {
  bool _tosAccepted = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final prefs = await SharedPreferencesService.getInstance();
      final isTosAccepted = await prefs.isTosAccepted();
      setState(() {
        _tosAccepted = isTosAccepted;
        if (!_tosAccepted) {
          showTos();
        }
      });
    });
    super.initState();
  }

  Future<void> setTos(bool value) async {
    final prefs = await SharedPreferencesService.getInstance();
    await prefs.setTosAccepted(value);
  }

  @override
  Widget build(BuildContext context) {
    String route = widget.data(key: "redirectTo") ?? "";
    String nextPage = route.isNotEmpty ? route : HomePage.path;
    return MainScaffold(
      body: SignInScreen(
          actions: [
            AuthStateChangeAction<SignedIn>(
              (context, state) async {
                FirestoreService firestoreService = FirestoreService();
                await firestoreService.updateFcmToken();
                await firestoreService.getTranslator();

                routeTo(
                  nextPage,
                  removeUntilPredicate: (route) => false,
                );
              },
            ),
            AuthStateChangeAction<UserCreated>((context, state) {
              routeTo(
                nextPage,
                removeUntilPredicate: (route) => false,
              );
            }),
          ],
          footerBuilder: (context, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: TermsAndConditions(onClickedCb: () {
                showTos();
              }),
            );
          }),
    );
  }

  void showTos() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("termsAndConditionsLabel".tr()),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text("tosText".tr()),
                Text("\n${"infoVerification".tr()}")
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("iAgree".tr().toUpperCase()),
              onPressed: () async {
                _tosAccepted = true;
                await setTos(_tosAccepted);
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
