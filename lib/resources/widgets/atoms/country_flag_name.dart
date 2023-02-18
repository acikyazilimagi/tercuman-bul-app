import 'package:flutter/material.dart';

import '../../themes/styles/light_theme_colors.dart';

class CountryFlagName extends StatelessWidget {
  final String code;
  final String name;
  final String type;
  final TextStyle? textStyle;

  const CountryFlagName({
    Key? key,
    required this.code,
    required this.name,
    this.textStyle,
    this.type = "country",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          color: LightThemeColors().grey.shade300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Text(
              code.toUpperCase(),
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(name, style: textStyle),
      ],
    );
  }
}
