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
          icon: const Icon(Icons.home),
          label: "homePage".tr(),
        ),
        AuthService().currentTranslator == null
            ? BottomNavigationBarItem(
                icon: const Icon(Icons.add_circle_outline),
                label: "beInterpreter".tr(),
              )
            : BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: "translatorProfile".tr(),
              ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
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
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
