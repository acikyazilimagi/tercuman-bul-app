import 'dart:convert';

import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/controller.dart';
import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_button.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_expandable_card.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_selectable_tile.dart';
import 'package:flutter_app/resources/widgets/molecules/contact_us_card.dart';
import 'package:flutter_app/resources/widgets/molecules/language_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../widgets/atoms/country_flag_name.dart';
import '../widgets/molecules/main_scaffold.dart';
import '../widgets/molecules/contact_link_field.dart';
import '../widgets/molecules/country_dialing_code_picker.dart';

class ComponentsDemoPage extends NyStatefulWidget {
  static final String path = "/demo";
  final Controller controller = Controller();

  @override
  _ComponentsDemoPageState createState() => _ComponentsDemoPageState();
}

class _ComponentsDemoPageState extends NyState<ComponentsDemoPage> {
  List<dynamic>? countryData;

  @override
  init() async {
    super.init();
    String json = await DefaultAssetBundle.of(this.context)
        .loadString("public/assets/data/countries.json");
    countryData = jsonDecode(json);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      showBottomNavigationBar: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            iconButtons(),
            SizedBox(height: 20),
            textField(),
            SizedBox(height: 20),
            flags(),
            SizedBox(height: 16),
            ContactLinkField(
              hint: "addFacebook".tr(),
              companyLogo: MdiIcons.facebook,
            ),
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
            CustomSelectableTile(
              titleText: "onsiteSupport".tr(),
              isSelected: true,
              onSelectStateChanged: (isSele) {},
            ),
            SizedBox(height: 16),
            expandableCards(),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  "Contact Us Card",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),
                ContactUsCard(
                  title: "cantFind".tr(),
                  description: "reachSupport".tr(),
                  buttonText: "contactUsButton".tr(),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column expandableCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          "Expandable Card",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16),
        Text(
          "Initially Expanded Card",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomExpandableCard(
          initialExpanded: true,
          centerIcon: false,
          backgrounColor: LightThemeColors().background,
          topic: Text(
            "becomeVolunteerHeader".tr(),
            style: Theme.of(context).textTheme.titleLarge!,
          ),
          content: Text(
            "becomeVolunteerBody".tr(),
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
        ),
      ],
    );
  }

  Widget textField() {
    return Column(
      children: [
        CustomTextField(
            title: "firstNameInputTitle".tr(), hint: "firstNameInputHint".tr())
      ],
    );
  }

  Widget iconButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          "Icon Buttons - Block",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16),
        Text(
          "Dark Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "searchInterpreter".tr(),
          icon: Icons.search_sharp,
          style: CustomButtonStyles.darkFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Dark Button Disabled",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          disabled: true,
          text: "searchInterpreter".tr(),
          icon: Icons.search_sharp,
          style: CustomButtonStyles.darkFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Light Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "searchInterpreter".tr(),
          icon: Icons.add_circle_outline_outlined,
          style: CustomButtonStyles.lightFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Light Button Disabled",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          disabled: true,
          text: "searchInterpreter".tr(),
          icon: Icons.add_circle_outline_outlined,
          style: CustomButtonStyles.lightFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Icon Buttons - Normal",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16),
        Text(
          "Light Normal Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "searchInterpreter".tr(),
          size: CustomButtonSize.normal,
          style: CustomButtonStyles.lightFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Dark Normal Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "searchInterpreter".tr(),
          size: CustomButtonSize.normal,
          style: CustomButtonStyles.darkFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Disabled Normal Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          disabled: true,
          text: "searchInterpreter".tr(),
          size: CustomButtonSize.normal,
          style: CustomButtonStyles.lightFilled,
          onPressed: () {},
        ),
      ],
    );
  }

  Column flags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Country Flag (tr)",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8),
        CountryFlag(
          country: Country.tr, // You can also use Country.fromCode('eg')
          height: 50,
        ),
        SizedBox(height: 8),
        Text(
          "Language Flag (az)",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8),
        LanguageFlag(
          language: Language.az, // You can also use Country.fromCode('eg')
          height: 50,
        ),
        SizedBox(height: 8),
        CountryFlagName(code: 'tr', name: 'Turkey'),
        SizedBox(height: 8),
        CountryDialingCodePicker(countryData: countryData),
        LanguagePicker(),
      ],
    );
  }
}
