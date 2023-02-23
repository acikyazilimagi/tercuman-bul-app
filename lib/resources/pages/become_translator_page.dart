import 'package:flutter/material.dart';
import 'package:flutter_app/app/events/register_event.dart';
import 'package:flutter_app/app/services/firestore_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/pages/translator_list_page.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';
import 'package:flutter_app/resources/widgets/loader_widget.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/controllers/auth_controller.dart';
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
  static const String path = "/become-translator";

  @override
  get controller => AuthController();

  BecomeTranslatorPage({super.key});

  @override
  State<BecomeTranslatorPage> createState() => _BecomeTranslatorPageState();
}

class _BecomeTranslatorPageState extends NyState<BecomeTranslatorPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _messengerController = TextEditingController();
  final _twitterController = TextEditingController();
  bool _isOnSiteSupport = true;
  bool _isDigitalOnlineSupport = true;

  bool _sameAsWhatsApp = true;
  List<String> _selectedLanguages = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _whatsappController.dispose();
    _messengerController.dispose();
    _twitterController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedTabIndex: 1,
      body: SafeAreaWidget(
        child: SingleChildScrollView(
          child: Column(
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
                onOpen: (link) => routeTo(TranslatorListPage.path),
                textAlign: TextAlign.center,
                text: "beInterpreterDescription".tr(),
                linkStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getSpacer,
                    CustomTextField(
                      title: "firstNameInputTitle".tr(),
                      hint: "firstNameInputHint".tr(),
                      controller: _firstNameController,
                      validator: (value) => value == null || value.isEmpty
                          ? "firstNameInputHint".tr()
                          : null,
                    ),
                    getSpacer,
                    CustomTextField(
                      title: "lastNameInputTitle".tr(),
                      hint: "lastNameInputHint".tr(),
                      controller: _lastNameController,
                      validator: (value) => value == null || value.isEmpty
                          ? "lastNameInputHint".tr()
                          : null,
                    ),
                    getSpacer,
                    Text(
                      "supportChannels".tr(),
                      style: const TextStyle(fontWeight: FontWeight.w800),
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
                      style: const TextStyle(fontWeight: FontWeight.w800),
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
                            ? const Icon(MdiIcons.check, color: Colors.green)
                            : null,
                      ),
                      onChanged: (values) {
                        setState(() {
                          _selectedLanguages =
                              values.map((e) => e.key).toList();
                        });
                      },
                      validator: (value) => value == null || value.isEmpty
                          ? "chooseLanguage".tr()
                          : null,
                    ),
                    getSpacer,
                    Text(
                      "addContactAddress".tr(),
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    getSpacer,
                    PhoneInput(
                      title: "phoneNumber".tr(),
                      hint: "phoneNumberHelper".tr(),
                      controller: _phoneController,
                      validator: (value) =>
                          value?.number == null || value!.number.isEmpty
                              ? "phoneNumberHelper".tr()
                              : null,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Checkbox(
                            value: _sameAsWhatsApp,
                            onChanged: (value) => setState(() {
                              _sameAsWhatsApp = value ?? false;
                            }),
                          ),
                          const SizedBox(width: 5),
                          TextButton(
                            onPressed: () => setState(() {
                              _sameAsWhatsApp = !_sameAsWhatsApp;
                            }),
                            child: Text("sameAsWhatsApp".tr()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: !_sameAsWhatsApp ? context.veryLowHeight : 0),
                    Visibility(
                      visible: !_sameAsWhatsApp,
                      child: PhoneInput(
                        hint: "addWhatsApp".tr(),
                        enabled: !_sameAsWhatsApp,
                        controller: _sameAsWhatsApp
                            ? _phoneController
                            : _whatsappController,
                        validator: (value) => value?.number != null &&
                                value!.number.isNotEmpty
                            ? "addWhatsApp".tr()
                            : null,
                      ),
                    ),
                    getSpacer,
                    ContactLinkField(
                      hint: "addMessenger".tr(),
                      companyLogo: MdiIcons.facebookMessenger,
                      controller: _messengerController,
                    ),
                    getSpacer,
                    ContactLinkField(
                      hint: "addTwitter".tr(),
                      companyLogo: MdiIcons.twitter,
                      controller: _twitterController,
                    ),
                    getSpacer,
                    isLocked("register")
                        ? const Loader()
                        : CustomButton(
                            text: "registerText".tr(),
                            icon: Icons.add,
                            style: CustomButtonStyles.darkFilled,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                event<RegisterEvent>(data: {
                                  "first_name": _firstNameController.text,
                                  "last_name": _lastNameController.text,
                                  "phone": _phoneController.text,
                                  "languages": _selectedLanguages,
                                  "whatsapp": _sameAsWhatsApp
                                      ? _phoneController.text
                                      : _whatsappController.text,
                                  "messenger": _messengerController.text,
                                  "twitter": _twitterController.text,
                                  "on_site_support": _isOnSiteSupport,
                                  "digital_online_support":
                                      _isDigitalOnlineSupport,
                                });

                                await lockRelease("register",
                                    perform:
                                        FirestoreService().createTranslator);

                                routeTo(TranslatorListPage.path);
                              }
                            },
                          ),
                    const ContactUsCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get getSpacer => SizedBox(height: context.veryLowHeight);
}
