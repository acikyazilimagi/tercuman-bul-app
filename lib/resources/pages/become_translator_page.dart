import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';
import 'package:flutter_app/resources/widgets/molecules/main_app_bar.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../themes/styles/light_theme_colors.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/atoms/custom_selectable_tile.dart';
import '../widgets/molecules/contact_link_field.dart';
import '../widgets/molecules/contact_us_card.dart';
import '../widgets/molecules/country_dialing_code_picker.dart';

class BecomeTranslatorPage extends NyStatefulWidget {
  static final String path = "/become-translator";
  BecomeTranslatorPage({super.key});

  @override
  State<BecomeTranslatorPage> createState() => _BecomeTranslatorPageState();
}

class _BecomeTranslatorPageState extends NyState<BecomeTranslatorPage> {
  List? countryData;

  @override
  init() async {
    String json = await DefaultAssetBundle.of(this.context)
        .loadString("public/assets/data/countries.json");
    setState(() {
      countryData = jsonDecode(json);
    });
    debugPrint(countryData.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SafeAreaWidget(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: context.veryLowSymPadding,
          children: [
            Text(
              "beInterpreter".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: LightThemeColors().title,
                  ),
            ),
            getSpacer,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text:
                          "Tercüman olmak için aşağıdaki formu doldurabilirsiniz. Tercüman listesine "),
                  TextSpan(
                      text: "buradan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: " ulaşabilirsiniz."),
                ],
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
            getSpacer,
            CustomTextField(
                title: "firstNameInputTitle".tr(),
                hint: "firstNameInputHint".tr()),
            CustomTextField(
                title: "lastNameInputTitle".tr(),
                hint: "lastNameInputHint".tr()),
            Text(
              "supportChannels".tr(),
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            getSpacer,
            CustomSelectableTile(
                isSelected: false,
                onSelectStateChanged: (_) {},
                titleText: "onsiteSupport".tr()),
            CustomSelectableTile(
                isSelected: false,
                onSelectStateChanged: (_) {},
                titleText: "onlineSupport".tr()),
            getSpacer,
            Text(
              "availableSupport".tr(),
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            getSpacer,
            CountryDialingCodePicker(countryData: countryData),
            getSpacer,
            Text(
              "addContactAddress".tr(),
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            getSpacer,
            ContactLinkField(
                hint: "addFacebook".tr(), companyLogo: MdiIcons.facebook),
            ContactLinkField(
              hint: "addInstagram".tr(),
              companyLogo: MdiIcons.instagram,
            ),
            ContactLinkField(
              hint: "addTwitter".tr(),
              companyLogo: MdiIcons.twitter,
            ),
            ContactLinkField(
              hint: "addLinkedin".tr(),
              companyLogo: MdiIcons.linkedin,
            ),
            CustomButton(
              text: "register".tr(),
              icon: Icons.search_sharp,
              style: CustomButtonStyles.darkFilled,
              onPressed: () {},
            ),
            ContactUsCard(
              title: "cantFind".tr(),
              description: "reachSupport".tr(),
              buttonText: "contactUsButton".tr(),
              onPressed: () async {
                await NyLocalization.instance
                    .setLanguage(context, language: "tr");
              },
            )
          ],
        ),
      ),
    );
  }

  Widget get getSpacer => SizedBox(height: context.veryLowHeight);
}
