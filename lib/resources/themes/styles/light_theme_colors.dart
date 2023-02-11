import 'package:flutter/material.dart';
import '/resources/themes/styles/color_styles.dart';

/*
|--------------------------------------------------------------------------
| Light Theme Colors
|--------------------------------------------------------------------------
*/

class LightThemeColors implements ColorStyles {
  //*  Guideline Color Scheme (Light) Colors
  Color get white => Color(0xFFFFFFFF);
  Color get background => Color(0xFFF9FAFB);
  Color get tableContext => Color(0xFF101828);
  Color get title => Color(0xFF101828);
  Color get context => Color(0xFF223A52);
  Color get contextAlternative => Color(0xFF475467);
  MaterialColor get grey => MaterialColor(0xFFDBDBDB, <int, Color>{
        50: Color(0xFFFEFEFE),
        100: Color(0xFFFBFBFB),
        200: Color(0xFFF7F7F7),
        300: Color(0xFFF4F4F4),
        400: Color(0xFFF0F0F0),
        500: Color(0xFFECECEC),
        600: Color(0xFFE9E9E9),
        700: Color(0xFFE5E5E5),
        800: Color(0xFFE2E2E2),
        900: Color(0xFFDEDEDE),
      });

  Color get primaryContent => const Color(0xFF000000);
  Color get primaryAccent => const Color(0xFF87c694);

  Color get surfaceBackground => Colors.white;
  Color get surfaceContent => Colors.black;

  // app bar
  Color get appBarBackground => Colors.blue;
  Color get appBarPrimaryContent => Colors.white;

  // buttons
  Color get buttonBackground => Colors.blueAccent;
  Color get buttonPrimaryContent => Colors.white;

  // bottom tab bar
  Color get bottomTabBarBackground => Colors.white;

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected => Colors.blue;
  Color get bottomTabBarIconUnselected => Colors.black54;

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected => Colors.black45;
  Color get bottomTabBarLabelSelected => Colors.black;
}
