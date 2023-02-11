import 'package:flutter/material.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:flutter_app/resources/pages/refresh_password_page.dart';
import 'package:flutter_app/resources/pages/register_page.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_button.dart';
import 'package:flutter_app/resources/widgets/molecules/main_app_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../themes/styles/light_theme_colors.dart';

class SignInPage extends NyStatefulWidget {
  static final String path = "/sign-in";
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends NyState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
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
          getSpacer,
          Text(
            "Hoş geldin, bilgilerini gir.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          getSpacer,
          CustomTextField(
            title: "E-Posta",
            hint: "E-Postanız",
            isDense: true,
            keyboardType: TextInputType.emailAddress,
            fillColor: Colors.white,
          ),
          CustomTextField(
            title: "Şifre",
            hint: "Şifre",
            isDense: true,
            fillColor: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("Beni 30 gün hatırla"),
                ],
              ),
              ActionChip(
                onPressed: () => routeTo(RefreshPasswordPage.path),
                label: Text("Şifremi Unuttum"),
                labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: LightThemeColors().context,
                    fontWeight: FontWeight.bold),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
          getSpacer,
          CustomButton(
            text: "Giriş yap",
            style: CustomButtonStyles.darkFilled,
            onPressed: () {},
            size: CustomButtonSize.normal,
          ),
          getSpacer,
          CustomButton(
            text: "Google ile giriş yap",
            icon: MdiIcons.google,
            style: CustomButtonStyles.lightFilled,
            onPressed: () {},
            size: CustomButtonSize.normal,
          ),
          getSpacer,
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
    );
  }

  Widget get getSpacer => SizedBox(height: context.veryLowHeight);
}
