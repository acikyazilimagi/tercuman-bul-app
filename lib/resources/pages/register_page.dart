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
  void dispose() {
    super.dispose();
  }

  bool tcCheckbox = false;
  bool truthAckCheckbox = false;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromRGBO(
                              34,
                              58,
                              82,
                              1,
                            )),
                    checkColor: Colors.white,
                    value: tcCheckbox,
                    onChanged: (bool? value) {
                      setState(() {
                        tcCheckbox = value!;
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
            Wrap(
              children: [
                Checkbox(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromRGBO(
                              34,
                              58,
                              82,
                              1,
                            )),
                    checkColor: Colors.white,
                    value: truthAckCheckbox,
                    onChanged: (bool? value) {
                      setState(() {
                        truthAckCheckbox = value!;
                      });
                    }),
                SizedBox(
                  width: 300 * MediaQuery.of(context).textScaleFactor,
                  child: Text("truthAck".tr(),
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(
                          34,
                          58,
                          82,
                          1,
                        ),
                      )),
                ),
              ],
            ),
            getSpacer,
            CustomButton(
              text: "registerWithGoogle".tr(),
              icon: MdiIcons.google,
              style: CustomButtonStyles.lightFilled,
              onPressed: () {},
              size: CustomButtonSize.normal,
            ),
            getSpacer,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "alreadyHaveAnAccount".tr()),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "login".tr(),
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

  Future openDialog() => showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              icon: IconButton(
                alignment: Alignment.topRight,
                icon: Icon(MdiIcons.close),
                onPressed: () => Navigator.pop(context),
              ),
              content: SingleChildScrollView(
                child: Text("tcpp".tr()),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("I Accept!"),
                    Checkbox(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromRGBO(
                                  34,
                                  58,
                                  82,
                                  1,
                                )),
                        checkColor: Colors.white,
                        value: tcCheckbox,
                        onChanged: (bool? value) {
                          setState(() {
                            tcCheckbox = value!;
                          });
                          Navigator.pop(context);
                        }),
                  ],
                )
              ],
            )),
      );
}
