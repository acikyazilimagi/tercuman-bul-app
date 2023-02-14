import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/languages.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:flutter_app/app/networking/translator_api_service.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:flutter_app/resources/widgets/loader_widget.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../themes/styles/light_theme_colors.dart';
import '../widgets/atoms/country_flag_name.dart';
import '../widgets/atoms/custom_dropdown.dart';
import '../widgets/atoms/custom_expandable_card.dart';
import '../widgets/molecules/main_scaffold.dart';

class TranslatorListPage extends NyStatefulWidget {
  static final String path = "/translator-list";
  TranslatorListPage({super.key});

  @override
  State<TranslatorListPage> createState() => _TranslatorListPageState();
}

class _TranslatorListPageState extends NyState<TranslatorListPage> {
  late List<Translator> translators;
  late TranslatorApiService service;

  bool sortNameAsc = true;
  bool isDataLoading = true;
  String? selectedLanguageKey;

  @override
  init() async {
    service = TranslatorApiService(buildContext: context);
    List<Translator> translatorsToSet = await service.all();
    setState(() {
      translators = translatorsToSet;
      isDataLoading = false;
    });
    return super.init();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedTabIndex: 2,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isDataLoading
            ? Loader()
            : ListView(
                padding: context.veryLowSymPadding,
                children: [
                  Text(
                    "interpreterList".tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: LightThemeColors().title),
                  ),
                  getSpacer,
                  Linkify(
                    onOpen: (link) => routeTo("/become-translator"),
                    textAlign: TextAlign.center,
                    text: "interpreterListDescription".tr(),
                    linkStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_on_outlined, size: 20.0),
                        TextButton(
                          onPressed: () =>
                              setState(() => sortNameAsc = !sortNameAsc),
                          child: Text("nameSurname".tr()),
                        ),
                        IconButton(
                          onPressed: () =>
                              setState(() => sortNameAsc = !sortNameAsc),
                          icon: Icon(
                            sortNameAsc
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            size: 20.0,
                          ),
                        ),
                        Spacer(flex: 1),
                        Expanded(
                          flex: 2,
                          child: CustomDropdown<MapEntry<String, String>>(
                            items: Languages.usableLanguages,
                            hint: "chooseLanguage".tr(),
                            showSearchBox: true,
                            itemAsString: (item) => item.value,
                            itemBuilder: (context, item, isSelected) =>
                                ListTile(
                              title: CountryFlagName(
                                code: item.key,
                                name: item.value,
                                type: 'lang',
                              ),
                              trailing: isSelected
                                  ? Icon(MdiIcons.check, color: Colors.green)
                                  : null,
                            ),
                            onChanged: (value) {
                              setState(() => selectedLanguageKey = value?.key);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  _translatorList(),
                ],
              ),
      ),
    );
  }

  Widget _translatorList() {
    var filteredTranslators = translators
        .where((e) =>
            selectedLanguageKey == null ||
            e.languages.contains(selectedLanguageKey))
        .toList();
    filteredTranslators.sort((a, b) =>
        sortNameAsc ? a.name.compareTo(b.name) : b.name.compareTo(a.name));

    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: filteredTranslators.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => CustomExpandableCard(
          topic: Row(
            children: [
              Text(
                "0.5\r\nkm",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              getSpacer,
              Text(
                filteredTranslators[index].name,
                style: TextStyle(
                  color: LightThemeColors().title,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'translationLanguage'.tr(),
                  style: TextStyle(fontSize: 12),
                ),
                getSpacer,
                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 16,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width / 100,
                  children: filteredTranslators[index]
                      .languages
                      .map((e) => CountryFlagName(
                            code: e,
                            name: Languages.usableLanguages
                                .firstWhere((w) => w.key == e)
                                .value,
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            type: 'lang',
                          ))
                      .toList(),
                ),
                getSpacer,
                if (filteredTranslators[index]
                        .contact
                        ?.haveAnyContactInformation ==
                    true) ...{
                  Text(
                    'contantInformation'.tr(),
                    style: TextStyle(fontSize: 12),
                  ),
                  getSpacer,
                  GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width / 100,
                    children: [
                      if (filteredTranslators[index]
                              .contact
                              ?.facebook
                              ?.isNotEmpty ==
                          true)
                        _contactButton("facebook",
                            "https://www.facebook.com/${filteredTranslators[index].contact!.facebook}"),
                      if (filteredTranslators[index]
                              .contact
                              ?.twitter
                              ?.isNotEmpty ==
                          true)
                        _contactButton("twitter",
                            "https://twitter.com/${filteredTranslators[index].contact!.twitter}"),
                      if (filteredTranslators[index]
                              .contact
                              ?.instagram
                              ?.isNotEmpty ==
                          true)
                        _contactButton("instagram",
                            "https://www.instagram.com/${filteredTranslators[index].contact!.instagram}"),
                      if (filteredTranslators[index]
                              .contact
                              ?.linkedin
                              ?.isNotEmpty ==
                          true)
                        _contactButton("linkedin",
                            "https://www.linkedin.com/in/${filteredTranslators[index].contact!.linkedin}"),
                    ],
                  ),
                }
              ],
            ),
          ),
          backgrounColor: LightThemeColors().background,
        ),
      ),
    );
  }

  Widget _contactButton(String type, String linkToOpen) => ElevatedButton.icon(
        onPressed: () async {
          if (await canLaunchUrl(Uri.parse(linkToOpen))) {
            await launchUrl(Uri.parse(linkToOpen));
          } else {
            print("Error: Contact link didn't open");
          }
        },
        label: Text(type.tr()),
        icon: Icon(MdiIcons.fromString(type)),
        style: ElevatedButton.styleFrom(
          backgroundColor: LightThemeColors().context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  Widget get getSpacer => SizedBox(height: context.veryLowHeight);
}
