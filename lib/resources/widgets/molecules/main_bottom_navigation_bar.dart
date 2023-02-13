import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../themes/styles/light_theme_colors.dart';

class MainBottomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "homePage".tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "beInterpreter".tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: "searchInterpreter".tr(),
        ),
      ],
      currentIndex: 0,
      backgroundColor: LightThemeColors().context,
      selectedItemColor: LightThemeColors().white,
      selectedIconTheme: IconThemeData(
        color: LightThemeColors().white,
      ),
      unselectedItemColor: LightThemeColors().grey.shade400,
      unselectedIconTheme: IconThemeData(
        color: LightThemeColors().grey.shade400,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
