import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../app/models/languages.dart';
import '../../themes/styles/light_theme_colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      centerTitle: false,
      backgroundColor: LightThemeColors().white,
      title: SizedBox(
        height: 40.0,
        child: Image.asset(getImageAsset("logo_horiz.png")),
      ),
      actions: [
        PopupMenuButton(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Image.asset(
                  getImageAsset(
                      "flags/${NyLocalization.instance.languageCode}.png"),
                  height: 24.0,
                ),
              ),
              Text(
                Languages.appLanguages
                    .firstWhere(
                        (e) => e.key == NyLocalization.instance.languageCode)
                    .value,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: LightThemeColors().context,
              ),
            ],
          ),
          itemBuilder: (context) => Languages.appLanguages
              .map(
                (e) => PopupMenuItem(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          getImageAsset("flags/${e.key}.png"),
                          height: 24.0,
                        ),
                      ),
                      Text(
                        e.value,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  value: e.key,
                ),
              )
              .toList(),
          onSelected: (value) async {
            await NyLocalization.instance.setLanguage(context, language: value);
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
