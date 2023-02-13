import 'package:flutter/material.dart';

import '../../../app/models/languages.dart';
import '../../themes/styles/light_theme_colors.dart';
import '../atoms/country_flag_name.dart';

class LanguagePicker extends StatefulWidget {

  LanguagePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguagePicker> createState() => _State();
}

class _State extends State<LanguagePicker> {
  late String _value;

  @override
  Widget build(BuildContext context) {
    _value = 'en';
    return DropdownButtonFormField(
      // isDense: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: LightThemeColors().grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: LightThemeColors().grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: LightThemeColors().grey.shade300,
      ),
      dropdownColor: LightThemeColors().grey.shade300,
      value: _value,
      onChanged: (String? newValue) {
        setState(() {
          _value = newValue!;
        });
      },
      items: Languages.usableLanguages
          .map(
            (e) {
              return DropdownMenuItem(
                value: e.key,
                child: CountryFlagName(
                    code: e.key, name: e.value, type: 'lang'),
              );
            }
          )
          .toList(),
      isExpanded: true,
    );
  }
}
