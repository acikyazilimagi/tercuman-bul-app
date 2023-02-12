import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import '../../themes/styles/light_theme_colors.dart';
import '../atoms/country_flag_name.dart';

class LanguagePicker extends StatefulWidget {
  final List<MapEntry<String,String>> languageData;

  LanguagePicker({
    Key? key,
    required context,
  }) : languageData = LocaleNames.of(context)!.sortedByName.where((e) {
    return e.key.length == 2;
  }).toList(),
        super(key: key);

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
      items: widget.languageData
          .map(
            (e) {
              debugPrint(e.key);
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
