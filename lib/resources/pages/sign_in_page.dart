import 'package:flutter/material.dart';
import 'package:flutter_app/app/services/auth_service.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/pages/register_page.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_button.dart';
import 'package:flutter_app/resources/widgets/loader_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/events/login_event.dart';
import '../../bootstrap/helpers.dart';
import '../themes/styles/light_theme_colors.dart';
import '../widgets/atoms/main_scaffold.dart';

class SignInPage extends NyStatefulWidget {
  static final String path = "/sign-in";
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends NyState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MainScaffold(
        showBottomNavigationBar: false,
        body: ListView(
          padding: context.lowSymPadding,
          children: [
            Text(
              "Giriş Yap",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: LightThemeColors().title,
                  ),
            ),
            getSpacerLow,
            Text(
              "Hoş geldin.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            getSpacerMedium,
            isLocked("auth")
                ? Loader()
                : CustomButton(
                    text: "Google ile giriş yap",
                    icon: MdiIcons.google,
                    style: CustomButtonStyles.lightFilled,
                    onPressed: () async {
                      await lockRelease("auth",
                          perform: () async =>
                              await AuthService.instance.signInWithGoogle());
                      event<LoginEvent>(data: {
                        "auth_translator":
                            AuthService.instance.currentTranslator
                      });
                      await routeTo(HomePage.path);
                    },
                    size: CustomButtonSize.normal,
                  ),
            getSpacerLow,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Hesabın yok mu? "),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, RegisterPage.path),
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: LightThemeColors().context),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget get getSpacerLow => SizedBox(height: context.veryLowHeight);
  Widget get getSpacerMedium => SizedBox(height: context.mediumHeight);
}
