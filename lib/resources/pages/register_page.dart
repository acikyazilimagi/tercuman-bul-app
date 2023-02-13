import 'package:flutter/material.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../themes/styles/light_theme_colors.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/molecules/main_app_bar.dart';

class RegisterPage extends NyStatefulWidget {
  static final String path = "/register";
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends NyState<RegisterPage> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: MainAppBar(),
        body: ListView(
          padding: context.lowSymPadding,
          children: [
            Text(
              "register".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: LightThemeColors().title,
                  ),
            ),
            getSpacerMedium,
            CustomButton(
              text: "Google ile kayıt ol",
              icon: MdiIcons.google,
              style: CustomButtonStyles.lightFilled,
              onPressed: () {},
              size: CustomButtonSize.normal,
            ),
            getSpacer,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Hesabın var mı? "),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Giriş Yap",
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

  Widget get getSpacer => SizedBox(height: context.veryLowHeight);
  Widget get getSpacerMedium => SizedBox(height: context.mediumHeight);
}
