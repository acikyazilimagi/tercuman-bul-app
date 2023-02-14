import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';

class CountryFlagName extends StatelessWidget {
  final String code;
  final String name;
  final String type;
  final TextStyle? textStyle;

  CountryFlagName({
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
        this.type == 'country'
            ? CountryFlag(country: Country.fromCode(code), height: 16)
            : LanguageFlag(
                language: Language.fromCode(
                    code == "is" || code == "as" ? "l_" + code : code),
                height: 16),
        SizedBox(width: 8),
        Text(name, style: textStyle),
      ],
    );
  }
}
