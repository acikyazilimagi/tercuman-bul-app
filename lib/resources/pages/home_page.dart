import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/app/services/location_service.dart';
import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_expandable_card.dart';
import 'package:flutter_app/resources/widgets/molecules/contact_us_card.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/services/auth_service.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/molecules/main_scaffold.dart';

class HomePage extends NyStatefulWidget {
  static final String path = "/home-page";
  final HomeController controller = HomeController();
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends NyState<HomePage> {
  List<String> selectedLanguages = [];

  @override
  init() async {
    await LocationService().init();
    super.init();
  }

  @override
  dispose() async {
    await LocationService().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hasSession = AuthService().hasSession;

    return MainScaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: LightThemeColors().grey.shade300,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("welcomeText".tr()),
              ),
              SizedBox(height: 32),
              Text(
                "welcomeHeader".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: LightThemeColors().title,
                    ),
              ),
              SizedBox(height: 32),
              Text(
                "welomeBody".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: LightThemeColors().contextAlternative,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: 16),
              CustomButton(
                text: "beInterpreter".tr(),
                icon: Icons.add_circle_outline_outlined,
                style: CustomButtonStyles.lightFilled,
                onPressed: () => hasSession
                    ? routeTo("/become-translator")
                    : routeTo("/auth",
                        data: {"redirectTo": "/become-translator"}),
              ),
              SizedBox(height: 12),
              CustomButton(
                text: "searchInterpreter".tr(),
                icon: Icons.search_sharp,
                style: CustomButtonStyles.darkFilled,
                onPressed: () => hasSession
                    ? routeTo("/translator-list")
                    : routeTo("/auth",
                        data: {"redirectTo": "/translator-list"}),
              ),
              SizedBox(height: 32),
              Text(
                "fAskedQuestions".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: LightThemeColors().title,
                    ),
              ),
              SizedBox(height: 32),
              Text(
                "thingsToKnow".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: LightThemeColors().contextAlternative,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: 16),
              CustomExpandableCard(
                initialExpanded: true,
                topic: Text(
                  "becomeVolunteerHeader".tr(),
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
                content: Text(
                  "becomeVolunteerBody".tr(),
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                backgrounColor: LightThemeColors().background,
              ),
              Divider(),
              CustomExpandableCard(
                topic: Text(
                  "interpreterResponsibilitiesHeader".tr(),
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
                content: Text(
                  "interpreterResponsibilitiesBody".tr(),
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                backgrounColor: LightThemeColors().background,
              ),
              Divider(),
              CustomExpandableCard(
                topic: Text(
                  "communicateOtherTranslator".tr(),
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
                content: Text(
                  "communicateOtherTranslator".tr(),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                backgrounColor: LightThemeColors().background,
              ),
              SizedBox(height: 32),
              ContactUsCard(
                title: "cantFind".tr(),
                description: "reachSupport".tr(),
                buttonText: "contactUsButton".tr(),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
