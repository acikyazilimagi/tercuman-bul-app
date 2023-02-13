import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/networking/translator_api_service.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:flutter_app/resources/pages/enter_verification_code_page.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../themes/styles/light_theme_colors.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/molecules/main_app_bar.dart';
import '/app/controllers/controller.dart';

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
  void dispose() {
    super.dispose();
  }

  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.transparent;
      }
      return Color.fromRGBO(
        34,
        58,
        82,
        1,
      );
    }

    return Scaffold(
      appBar: MainAppBar(),
      body: ListView(
        padding: context.lowWidthPadding,
        children: [
          getSpacer,
          Text(
            "register".tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: LightThemeColors().title,
                ),
          ),
          getSpacer,
          CustomTextField(
            title: "fullName".tr(),
            hint: "fullNameHelper".tr(),
            isDense: true,
            fillColor: Colors.white,
          ),
          CustomTextField(
            title: "E-Posta",
            hint: "E-Postanızı giriniz",
            isDense: true,
            keyboardType: TextInputType.emailAddress,
            fillColor: Colors.white,
          ),
          CustomTextField(
            title: "Şifre",
            hint: "Şifrenizi giriniz",
            isDense: true,
            fillColor: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  checkColor: Colors.white,
                  value: isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked1 = value!;
                    });
                  }),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () => openDialog(),
                        child: Text(
                          "Aydınlatma Metni",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                    TextSpan(
                        text: "'ni okudum ve kabul ediyorum.",
                        style: TextStyle(
                          color: Color.fromRGBO(
                            34,
                            58,
                            82,
                            1,
                          ),
                        )),
                  ],
                ),
                style: TextStyle(fontSize: 11),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  checkColor: Colors.white,
                  value: isChecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked2 = value!;
                    });
                  }),
              Text(
                  "Verdiğim bilgilerin doğru ve teyit edilmiş olduğunu, \nbilgi kirliliği ve yanlış uygulamalara yol açmamak için \ngerekli tüm önlem ve tedbirleri aldığımı, vermiş olduğum \nbilgilerde meydana gelen değişiklik ve güncellemeleri \nbildireceğimi kabul ve beyan ederim.",
                  style: TextStyle(
                    fontSize: 11,
                    color: Color.fromRGBO(
                      34,
                      58,
                      82,
                      1,
                    ),
                  )),
            ],
          ),
          getSpacer,
          CustomButton(
            text: "register".tr(),
            style: CustomButtonStyles.darkFilled,
            onPressed: () => Navigator.pushReplacementNamed(
                context, EnterVerificationCodePage.path),
            size: CustomButtonSize.normal,
          ),
          getSpacer,
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
    );
  }

  Widget get getSpacer => SizedBox(height: context.veryLowHeight);

  Future openDialog() => showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text("Information about Data Protection"),
              content: SingleChildScrollView(
                child: Text("tcpp".tr()),
              ),
              actions: <Widget>[
                Checkbox(
                    checkColor: Colors.white,
                    value: isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked1 = value!;
                      });
                      Navigator.pop(context);
                    }),
                Text("I Accept!")
              ],
            )),
      );
}
