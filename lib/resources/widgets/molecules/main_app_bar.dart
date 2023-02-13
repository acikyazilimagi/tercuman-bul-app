import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../themes/styles/light_theme_colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      centerTitle: false,
      backgroundColor: LightThemeColors().white,
      title: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 225,
              maxHeight: 28.54,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset('/public/assets/images/logo_lq.png'),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
