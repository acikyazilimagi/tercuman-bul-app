import 'package:flutter/material.dart';
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
          icon: Icon(Icons.search),
          label: "beInterpreter".tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
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
        var _routes = const {
          0: "/home-page",
          1: "/become-translator",
          2: "/translator-list",
        };

        String route = _routes[index] ?? "/home-page";

        if(route == "/home-page") {
          routeTo(route);
        } else if(AuthService().hasSession) {
          routeTo(_routes[index] ?? "/home-page");
        } else {
          routeTo(_routes[index] ?? "/home-page", data: { "redirectTo": _routes[index] ?? "/home-page"});
        }
      },
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
