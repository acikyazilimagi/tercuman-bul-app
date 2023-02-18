import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/services/firestore_service.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/widgets/atoms/terms_and_conditions.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _tosAccepted = false;

  @override
  void initState() {
    super.initState();
    _prefs.then((value) {
      _tosAccepted = value.getBool("tosAccepted") ?? false;
      setState(() {
        if (!_tosAccepted) {
          showTos();
        }
      });
    });
  }

  Future<void> setTos(bool tosValue) async {
    SharedPreferences prefs = await _prefs;
    prefs.setBool("tosAccepted", tosValue);
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
                await FirestoreService().getTranslator();
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
