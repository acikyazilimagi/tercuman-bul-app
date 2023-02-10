import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class RegisterPage extends NyStatefulWidget {
  static final String path = "/";
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
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

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
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  style: style,
                  onPressed: () async {
                    // TODO : for testing only
                    await NyLocalization.instance
                        .setLanguage(context, language: "tr");
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
