import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/become_translator_page.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/pages/translator_list_page.dart';
import 'package:flutter_app/resources/pages/translator_profile_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../app/services/auth_service.dart';
import '../../themes/styles/light_theme_colors.dart';

class MainBottomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int currentIndex;

  const MainBottomNavigationBar({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "homePage".tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: AuthService().currentTranslator == null
              ? "beInterpreter".tr()
              : "translatorProfile".tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "searchInterpreter".tr(),
        ),
      ],
      currentIndex: currentIndex,
      backgroundColor: LightThemeColors().context,
      selectedItemColor: LightThemeColors().white,
      selectedIconTheme: IconThemeData(
        color: LightThemeColors().white,
      ),
      unselectedItemColor: LightThemeColors().grey.shade400,
      unselectedIconTheme: IconThemeData(
        color: LightThemeColors().grey.shade400,
      ),
      onTap: (index) {
        routeTo({
              0: HomePage.path,
              1: AuthService().currentTranslator == null
                  ? BecomeTranslatorPage.path
                  : TranslatorProfilePage.path,
              2: TranslatorListPage.path,
            }[index] ??
            HomePage.path);
      },
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
