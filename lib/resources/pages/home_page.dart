import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/resources/pages/become_translator_page.dart';
import 'package:flutter_app/resources/pages/translator_list_page.dart';
import 'package:flutter_app/resources/pages/translator_profile_page.dart';
import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_expandable_card.dart';
import 'package:flutter_app/resources/widgets/molecules/contact_us_card.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/services/auth_service.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/molecules/main_scaffold.dart';

class HomePage extends NyStatefulWidget {
  static const String path = "/home-page";
  @override
  get controller => HomeController();
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends NyState<HomePage> {
  List<String> selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: LightThemeColors().grey.shade300,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("welcomeText".tr()),
              ),
              const SizedBox(height: 32),
              Text(
                "welcomeHeader".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: LightThemeColors().title,
                    ),
              ),
              const SizedBox(height: 32),
              Text(
                "welcomeBody".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: LightThemeColors().contextAlternative,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 16),
              AuthService().currentTranslator == null
                  ? CustomButton(
                      text: "beInterpreter".tr(),
                      icon: Icons.add_circle_outline_outlined,
                      style: CustomButtonStyles.lightFilled,
                      onPressed: () => routeTo(BecomeTranslatorPage.path),
                    )
                  : CustomButton(
                      text: "translatorProfile".tr(),
                      icon: Icons.edit,
                      style: CustomButtonStyles.lightFilled,
                      onPressed: () => routeTo(TranslatorProfilePage.path),
                    ),
              const SizedBox(height: 12),
              CustomButton(
                text: "searchInterpreter".tr(),
                icon: Icons.search_sharp,
                style: CustomButtonStyles.darkFilled,
                onPressed: () => routeTo(TranslatorListPage.path),
              ),
              const SizedBox(height: 32),
              Text(
                "fAskedQuestions".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: LightThemeColors().title,
                    ),
              ),
              const SizedBox(height: 32),
              Text(
                "thingsToKnow".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: LightThemeColors().contextAlternative,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 16),
              for (var i = 1; i <= 4; i++)
                Column(
                  children: [
                    CustomExpandableCard(
                      topic: Text(
                        "faq${i}Header".tr(),
                        style: Theme.of(context).textTheme.titleLarge!,
                      ),
                      content: Text(
                        "faq${i}Body".tr(),
                        style: Theme.of(context).textTheme.bodyLarge!,
                      ),
                      backgrounColor: LightThemeColors().background,
                    ),
                    const Divider(),
                  ],
                ),
              const SizedBox(height: 32),
              const ContactUsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
