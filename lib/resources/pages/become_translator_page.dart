import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/events/register_event.dart';
import 'package:flutter_app/app/services/firestore_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';
import 'package:flutter_app/resources/widgets/loader_widget.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/models/languages.dart';
import '../themes/styles/light_theme_colors.dart';
import '../widgets/atoms/country_flag_name.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/atoms/custom_multiselect_dropdown.dart';
import '../widgets/atoms/custom_selectable_tile.dart';
import '../widgets/molecules/main_scaffold.dart';
import '../widgets/molecules/contact_link_field.dart';
import '../widgets/molecules/contact_us_card.dart';

class BecomeTranslatorPage extends NyStatefulWidget {
  static final String path = "/become-translator";
  BecomeTranslatorPage({super.key});

  @override
  State<BecomeTranslatorPage> createState() => _BecomeTranslatorPageState();
}

class _BecomeTranslatorPageState extends NyState<BecomeTranslatorPage> {
  List? countryData;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _instagramController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _facebookController = TextEditingController();
  final _twitterController = TextEditingController();
  bool _isOnSiteSupport = false;
  bool _isDigitalOnlineSupport = false;

  List<String> _selectedLanguages = [];

  @override
  init() async {
    String json = await DefaultAssetBundle.of(this.context)
        .loadString("public/assets/data/countries.json");
    setState(() {
      countryData = jsonDecode(json);
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _instagramController.dispose();
    _linkedinController.dispose();
    _facebookController.dispose();
    _twitterController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedTabIndex: 1,
      body: SafeAreaWidget(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: context.veryLowSymPadding,
          children: [
            Text(
              "beInterpreter".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: LightThemeColors().title),
            ),
            getSpacer,
            Linkify(
              onOpen: (link) => routeTo("/translator-list"),
              textAlign: TextAlign.center,
              text: "beInterpreterDescription".tr(),
              linkStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            getSpacer,
            CustomTextField(
              title: "firstNameInputTitle".tr(),
              hint: "firstNameInputHint".tr(),
              controller: _firstNameController,
            ),
            getSpacer,
            CustomTextField(
              title: "lastNameInputTitle".tr(),
              hint: "lastNameInputHint".tr(),
              controller: _lastNameController,
            ),
            getSpacer,
            Text(
              "supportChannels".tr(),
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            getSpacer,
            CustomSelectableTile(
              isSelected: _isOnSiteSupport,
              onSelectStateChanged: (value) {
                setState(() => _isOnSiteSupport = value);
              },
              titleText: "onsiteSupport".tr(),
            ),
            CustomSelectableTile(
              isSelected: _isDigitalOnlineSupport,
              onSelectStateChanged: (value) {
                setState(() => _isDigitalOnlineSupport = value);
              },
              titleText: "onlineSupport".tr(),
            ),
            getSpacer,
            Text(
              "availableSupport".tr(),
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            getSpacer,
            CustomMultiselectDropdown<MapEntry<String, String>>(
              items: Languages.usableLanguages,
              hint: "chooseLanguage".tr(),
              showSearchBox: true,
              itemAsString: (item) => item.value,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: CountryFlagName(
                  code: item.key,
                  name: item.value,
                  type: 'lang',
                ),
                trailing: isSelected
                    ? Icon(MdiIcons.check, color: Colors.green)
                    : null,
              ),
              onChanged: (values) {
                setState(() {
                  _selectedLanguages = values.map((e) => e.key).toList();
                });
              },
            ),
            getSpacer,
            Text(
              "addContactAddress".tr(),
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            getSpacer,
            ContactLinkField(
              hint: "addFacebook".tr(),
              companyLogo: MdiIcons.facebook,
              controller: _facebookController,
            ),
            getSpacer,
            ContactLinkField(
              hint: "addInstagram".tr(),
              companyLogo: MdiIcons.instagram,
              controller: _instagramController,
            ),
            getSpacer,
            ContactLinkField(
              hint: "addTwitter".tr(),
              companyLogo: MdiIcons.twitter,
              controller: _twitterController,
            ),
            getSpacer,
            ContactLinkField(
              hint: "addLinkedin".tr(),
              companyLogo: MdiIcons.linkedin,
              controller: _linkedinController,
            ),
            getSpacer,
            isLocked("register")
                ? Loader()
                : CustomButton(
                    text: "register".tr(),
                    icon: Icons.search_sharp,
                    style: CustomButtonStyles.darkFilled,
                    onPressed: () async {
                      event<RegisterEvent>(data: {
                        "first_name": _firstNameController.text,
                        "last_name": _lastNameController.text,
                        "languages": _selectedLanguages,
                        "facebook": _facebookController.text,
                        "instagram": _instagramController.text,
                        "twitter": _twitterController.text,
                        "linkedin": _linkedinController.text,
                        "on_site_support": _isOnSiteSupport,
                        "digital_online_support": _isDigitalOnlineSupport,
                      });

                      if (_selectedLanguages.isEmpty) {
                        _selectedLanguages.add("en");
                      }

                      await lockRelease("register",
                          perform: () async =>
                              await FirestoreService().writeUser());
                      routeTo('/translator-list');
                    },
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
