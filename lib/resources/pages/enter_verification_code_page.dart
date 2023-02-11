import 'package:flutter/material.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../themes/styles/light_theme_colors.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/atoms/custom_textfield.dart';
import '../widgets/molecules/main_app_bar.dart';
import '../widgets/safearea_widget.dart';

class EnterVerificationCodePage extends StatefulWidget {
  static final String path = "/enter-verification-code";
  const EnterVerificationCodePage({super.key});

  @override
  State<EnterVerificationCodePage> createState() =>
      _EnterVerificationCodePageState();
}

class _EnterVerificationCodePageState extends State<EnterVerificationCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SafeAreaWidget(
        child: ListView(
          padding: context.veryLowSymPadding,
          shrinkWrap: true,
          children: [
            getSpacer,
            CircleAvatar(
              child: Icon(MdiIcons.emailVariant,
                  color: LightThemeColors().context),
              radius: 30,
              backgroundColor: LightThemeColors().context.withOpacity(0.5),
            ),
            getSpacer,
            Text(
              "E-postanı kontrol et",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: LightThemeColors().title,
                  ),
            ),
            getSpacer,
            Text(
              "Doğrulama kodunu e-posta adresine ilettik.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(),
            ),
            getSpacer,
            getSpacer,
            CustomTextField(
              title: "Doğrulama Kodu",
              hint: "Doğrulama kodunu giriniz",
              isDense: true,
              fillColor: Colors.white,
            ),
            CustomButton(
              text: "Kodu gir",
              style: CustomButtonStyles.darkFilled,
              onPressed: () {},
              size: CustomButtonSize.normal,
            ),
            getSpacer,
            CustomButton(
              text: "Giriş yapa dön",
              icon: MdiIcons.arrowLeft,
              style: CustomButtonStyles.lightFilled,
              onPressed: () => Navigator.pop(context),
              size: CustomButtonSize.normal,
            ),
          ],
        ),
      ),
    );
  }

  Widget get getSpacer => SizedBox(height: context.veryLowHeight);
}
