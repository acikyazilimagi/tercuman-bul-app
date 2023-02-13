import 'package:flutter/material.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../widgets/atoms/custom_button.dart';
import '../widgets/atoms/custom_textfield.dart';
import '../widgets/molecules/main_scaffold.dart';

class RefreshPasswordPage extends NyStatefulWidget {
  static final String path = "/refresh-password";
  RefreshPasswordPage({super.key});

  @override
  State<RefreshPasswordPage> createState() => _RefreshPasswordPageState();
}

class _RefreshPasswordPageState extends NyState<RefreshPasswordPage> {
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
              child:
                  Icon(MdiIcons.keyVariant, color: LightThemeColors().context),
              radius: 30,
              backgroundColor: LightThemeColors().context.withOpacity(0.5),
            ),
            getSpacer,
            Text(
              "forgotPassword".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: LightThemeColors().title,
                  ),
            ),
            getSpacer,
            Text(
              "forgotPasswordInfo".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(),
            ),
            getSpacer,
            CustomTextField(
              title: "email".tr(),
              hint: "emailHint".tr(),
              isDense: true,
              keyboardType: TextInputType.emailAddress,
              fillColor: Colors.white,
            ),
            CustomButton(
              text: "resetPassword".tr(),
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
