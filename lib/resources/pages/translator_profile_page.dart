import 'package:flutter/material.dart';
import 'package:flutter_app/app/services/auth_service.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/extensions/padding_extension.dart';
import 'package:flutter_app/resources/pages/translator_list_page.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/controllers/auth_controller.dart';
import '../../app/models/languages.dart';
import '../themes/styles/light_theme_colors.dart';
import '../widgets/atoms/custom_selectable_tile.dart';
import '../widgets/molecules/main_scaffold.dart';
import '../widgets/molecules/contact_us_card.dart';
import 'edit_translator_profile.dart';

class TranslatorProfilePage extends NyStatefulWidget {
  static const path = "/translator-profile";
  @override
  get controller => AuthController();
  TranslatorProfilePage({super.key});

  @override
  State<TranslatorProfilePage> createState() => _TranslatorProfilePageState();
}

class _TranslatorProfilePageState extends NyState<TranslatorProfilePage> {
  @override
  Widget build(BuildContext context) {
    final translator = AuthService().currentTranslator!;

    return MainScaffold(
      selectedTabIndex: 1,
      body: SafeAreaWidget(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: context.veryLowSymPadding,
          children: [
            Text(
              "yourProfile".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: LightThemeColors().title),
            ),
            getSpacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Linkify(
                  onOpen: (link) => routeTo(TranslatorListPage.path),
                  textAlign: TextAlign.center,
                  text: "yourProfileDescription".tr(),
                  linkStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                Linkify(
                  onOpen: (link) => routeTo(EditTranslatorProfilePage.path),
                  textAlign: TextAlign.center,
                  text: "editProfileDescription".tr(),
                  linkStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            getSpacer,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "nameSurname".tr(),
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                Text(
                  translator.name,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            getSpacer,
            Text(
              "supportChannels".tr(),
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            CustomSelectableTile(
              isSelected: translator.capabilities?.translatorInPerson ?? false,
              onSelectStateChanged: (value) {},
              titleText: "onsiteSupport".tr(),
            ),
            CustomSelectableTile(
              isSelected: translator.capabilities?.translatorVirtual ?? false,
              onSelectStateChanged: (value) {},
              titleText: "onlineSupport".tr(),
            ),
            getSpacer,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "availableSupport".tr(),
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                Text(
                  translator.languages
                      .map((l) => Languages.usableLanguages
                          .firstWhere((e) => e.key == l)
                          .value)
                      .join(", "),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            getSpacer,
            _socialMediaItem(
              icon: MdiIcons.whatsapp,
              title: "whatsapp".tr(),
              link: translator.contact?.whatsapp?.split("|").skip(1).join(),
            ),
            getSpacer,
            _socialMediaItem(
              icon: MdiIcons.facebookMessenger,
              title: "messenger".tr(),
              link: translator.contact?.messenger,
            ),
            getSpacer,
            _socialMediaItem(
              icon: MdiIcons.twitter,
              title: "twitter".tr(),
              link: translator.contact?.twitter,
            ),
            getSpacer,
            const ContactUsCard(),
          ],
        ),
      ),
    );
  }

  Widget _socialMediaItem(
      {required String title, required IconData icon, String? link}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 24),
            getSpacer,
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        const SizedBox(height: 4),
        link == null
            ? const Text("-")
            : Linkify(
                text: link,
                linkStyle: const TextStyle(color: Colors.grey),
                options: const LinkifyOptions(humanize: false),
                onOpen: (link) async {
                  var uri = Uri.parse(link.url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
              ),
      ],
    );
  }

  Widget get getSpacer => SizedBox(height: context.veryLowHeight);
}
