import 'package:flutter/material.dart';
import '/resources/themes/styles/color_styles.dart';

/*
|--------------------------------------------------------------------------
| Light Theme Colors
|--------------------------------------------------------------------------
*/

class LightThemeColors implements ColorStyles {
  //*  Guideline Color Scheme (Light) Colors
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get background => const Color(0xFFF9FAFB);
  Color get tableContext => const Color(0xFF101828);
  Color get title => const Color(0xFF101828);
  Color get context => const Color(0xFF223A52);
  Color get contextAlternative => const Color(0xFF475467);
  MaterialColor get grey => const MaterialColor(0xFFDBDBDB, <int, Color>{
        50: Color(0xFFFEFEFE),
        100: Color(0xFFFBFBFB),
        200: Color(0xFFF7F7F7),
        300: Color(0xFFF4F4F4),
        400: Color(0xFF98A2B3),
        500: Color(0xFFECECEC),
        600: Color(0xFFE9E9E9),
        700: Color(0xFFE5E5E5),
        800: Color(0xFFE2E2E2),
        900: Color(0xFFDEDEDE),
      });

  @override
  Color get primaryContent => const Color(0xFF000000);
  @override
  Color get primaryAccent => const Color(0xFF87c694);

  @override
  Color get surfaceBackground => Colors.white;
  @override
  Color get surfaceContent => Colors.black;

  // app bar
  @override
  Color get appBarBackground => Colors.blue;
  @override
  Color get appBarPrimaryContent => Colors.white;

  // buttons
  @override
  Color get buttonBackground => Colors.blueAccent;
  @override
  Color get buttonPrimaryContent => Colors.white;

  // bottom tab bar
  @override
  Color get bottomTabBarBackground => Colors.white;

  // bottom tab bar - icons
  @override
  Color get bottomTabBarIconSelected => Colors.blue;
  @override
  Color get bottomTabBarIconUnselected => Colors.black54;

  // bottom tab bar - label
  @override
  Color get bottomTabBarLabelUnselected => Colors.black45;
  @override
  Color get bottomTabBarLabelSelected => Colors.black;
}
