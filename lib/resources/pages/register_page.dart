import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class RegisterPage extends NyStatefulWidget {
  static final String path = "/register";
  final Controller controller = Controller();
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends NyState<RegisterPage> {
  List<String> selectedLanguages = [];

  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    bool tcppChecked = false;

    void _onTcppCbChanged(bool? newValue) => setState(() {
      tcppChecked = newValue != null ? newValue : false;
      //TODO: Box is not getting checked
      if (tcppChecked) {
        debugPrint('checked');
        // TODO: Enable registration button
      } else {
        debugPrint('not checked');
        // TODO: Disable registration button
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("appTitle".tr()),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              CustomTextField(
                title: "fullName".tr(),
                helper: "fullNameHelper".tr(),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 22),
              CustomChipTags(list: selectedLanguages),
              SizedBox(height: 28),
              Text("tcpp".tr()),
              SizedBox(height: 22),
              CheckboxListTile(
                title: Text("iAgree".tr()),
                value: tcppChecked,
                onChanged: _onTcppCbChanged,
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
              SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  style: buttonStyle,
                  onPressed: () async {
                    // TODO : for testing only

                    await NyLocalization.instance
                        .setLanguage(context, language: NyLocalization.instance.languageCode == 'en' ? 'tr' : 'en');
                    debugPrint(NyLocalization.instance.languageCode);
                  },
                  child: Text('register'.tr()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
