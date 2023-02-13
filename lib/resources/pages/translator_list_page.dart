import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/languages.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../widgets/atoms/country_flag_name.dart';
import '../widgets/atoms/custom_dropdown.dart';
import '../widgets/atoms/custom_textfield.dart';
import '../widgets/molecules/main_scaffold.dart';

class TranslatorListPage extends StatefulWidget {
  static final String path = "/translator-list";
  const TranslatorListPage({super.key});

  @override
  State<TranslatorListPage> createState() => _TranslatorListPageState();
}

class _TranslatorListPageState extends State<TranslatorListPage> {
  late List<Translator> translators;
  int? expandedTranslatorIndex;

  TextEditingController _nameSurnameController = TextEditingController();
  MapEntry<String, String>? _selectedLanguage;

  List<Translator> filteredTranslators = [];

  @override
  void initState() {
    // TODO: implement initState
    translators = [
      Translator(
          isInterpreter: false,
          location: GeoPoint(53, 52),
          languages: ["tr", "en"],
          name: "Çağla Büyükakçay"),
      Translator(
          isInterpreter: true,
          location: GeoPoint(53, 52),
          languages: ["en", "ar"],
          name: "Ahmet Serin"),
    ];
    filterData();
    super.initState();
  }

  filterData() {
    setState(() {
      filteredTranslators = translators
          .where((e) =>
              _nameSurnameController.text.isEmpty ||
              e.name
                  .toLowerCase()
                  .contains(_nameSurnameController.text.toLowerCase()))
          .where((e) =>
              _selectedLanguage == null ||
              e.languages.contains(_selectedLanguage!.key))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedTabIndex: 2,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: context.veryLowSymPadding,
          children: [
            Text(
              "interpreterList".tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            getSpacer,
            Text(
              "interpreterListDescription".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
            TextButton(
              child: Text(
                "newTranslatorLinkText".tr(),
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              onPressed: () => routeTo("/become-translator"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: "nameSurname".tr(),
                      controller: _nameSurnameController,
                      onChanged: (value) => filterData(),
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: CustomDropdown<MapEntry<String, String>>(
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
                      onChanged: (value) {
                        _selectedLanguage = value;
                        filterData();
                      },
                    ),
                  ),
                ],
              ),
            ),
            ExpansionPanelList(
              expansionCallback: (int i, bool isExpanded) {
                setState(() => expandedTranslatorIndex = isExpanded ? null : i);
              },
              children: filteredTranslators.map((translator) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    print((translator.languages.length / 2));
                    return ListTile(
                      title: Text(translator.name),
                    );
                  },
                  body: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.lowWidth,
                      vertical: context.veryLowHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "translationLanguage".tr(),
                          textAlign: TextAlign.left,
                        ),
                        getSpacer,
                        GridView.builder(
                          itemCount: translator.languages.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: context.lowHeight,
                            crossAxisSpacing: context.veryLowWidth,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return FilledButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.flag,
                                color: Colors.red,
                              ),
                              label: Text(
                                translator.languages[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              style: FilledButton.styleFrom(
                                  shape: BeveledRectangleBorder(),
                                  backgroundColor: Colors.transparent),
                            );
                            // return Container(
                            //   alignment: Alignment.center,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(5),
                            //     color: Colors.blue,
                            //   ),
                            //   padding: context.veryLowSymPadding,
                            //   child: Wrap(
                            //     crossAxisAlignment: WrapCrossAlignment.start,
                            //     children: [
                            //       Icon(Icons.flag),
                            //       Text(translator.languages[index],
                            //           textAlign: TextAlign.center),
                            //     ],
                            //   ),
                            // );
                          },
                        ),
                        getSpacer,
                        Text("contantInformation".tr()),
                        getSpacer,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 17,
                            ),
                            Text("  +90532*******"),
                          ],
                        ),
                        getSpacer,
                        getSpacer,
                        GridView.builder(
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 15,
                                  crossAxisCount: 2,
                                  mainAxisExtent: context.lowHeight,
                                  crossAxisSpacing: context.lowWidth),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ElevatedButton.icon(
                              onPressed: () {},
                              label: Text("instagram".tr()),
                              icon: Icon(MdiIcons.instagram),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(34, 58, 82, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  )),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  isExpanded: expandedTranslatorIndex ==
                      filteredTranslators.indexOf(translator),
                );
              }).toList(),
              elevation: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget get getSpacer => SizedBox(height: context.veryLowHeight);
}
