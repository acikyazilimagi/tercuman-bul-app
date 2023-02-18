import 'package:flutter/material.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../themes/styles/light_theme_colors.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/atoms/custom_textfield.dart';
import '../widgets/molecules/main_scaffold.dart';
import '../widgets/safearea_widget.dart';

class EnterVerificationCodePage extends StatefulWidget {
  static const String path = "/enter-verification-code";
  const EnterVerificationCodePage({super.key});

  @override
  State<EnterVerificationCodePage> createState() =>
      _EnterVerificationCodePageState();
}

class _EnterVerificationCodePageState extends State<EnterVerificationCodePage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      showBottomNavigationBar: false,
      body: SafeAreaWidget(
        child: ListView(
          padding: context.veryLowSymPadding,
          shrinkWrap: true,
          children: [
            getSpacer,
            CircleAvatar(
              radius: 30,
              backgroundColor: LightThemeColors().context.withOpacity(0.5),
              child: Icon(MdiIcons.emailVariant,
                  color: LightThemeColors().context),
            ),
            getSpacer,
            Text(
              "checkYourEmail".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: LightThemeColors().title,
                  ),
            ),
            getSpacer,
            Text(
              "verificationMailDelivered".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(),
            ),
            getSpacer,
            getSpacer,
            CustomTextField(
              title: "verificationCode".tr(),
              hint: "enterVerificationCode".tr(),
              isDense: true,
              fillColor: Colors.white,
            ),
            CustomButton(
              text: "enterTheCode".tr(),
              style: CustomButtonStyles.darkFilled,
              onPressed: () {},
              size: CustomButtonSize.normal,
            ),
            getSpacer,
            CustomButton(
              text: "returnLogin".tr(),
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
