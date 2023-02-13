import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/translator.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:flutter_app/resources/widgets/molecules/language_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../widgets/molecules/main_scaffold.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    translators = [
      Translator(
          isInterpreter: false,
          location: GeoPoint(53, 52),
          languages: ["Türkçe", "İngilizce"],
          name: "Çağla Büyükakçay"),
      Translator(
          isInterpreter: true,
          location: GeoPoint(53, 52),
          languages: ["İngilizce", "Fransızca"],
          name: "Ahmet Serin"),
    ];
    super.initState();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FilterChip(
                      label: Text("nameSurname".tr()),
                      onSelected: (_) {},
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  getSpacer,
                  Expanded(child: LanguagePicker()),
                ],
              ),
            ),
            ExpansionPanelList(
              expansionCallback: (int i, bool isExpanded) {
                setState(() => expandedTranslatorIndex = isExpanded ? null : i);
              },
              children: translators.map((translator) {
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
                      translators.indexOf(translator),
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
