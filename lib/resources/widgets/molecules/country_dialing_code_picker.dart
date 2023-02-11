import 'package:flutter/material.dart';

import '../../themes/styles/light_theme_colors.dart';
import '../atoms/country_flag_name.dart';

class CountryDialingCodePicker extends StatefulWidget {
  final List<dynamic>? countryData;

  CountryDialingCodePicker({
    Key? key,
    required this.countryData,
  }) : super(key: key);

  @override
  State<CountryDialingCodePicker> createState() => _State();
}

class _State extends State<CountryDialingCodePicker> {
  String _value = '+90';

  @override
  Widget build(BuildContext context) {
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
      items: widget.countryData
          ?.map(
            (e) => DropdownMenuItem(
              value: e["dialing_code"].toString(),
              child: CountryFlagName(code: e["code"], name: e["dialing_code"] + " " + e["name"]),
            ),
          )
          .toList(),
      isExpanded: true,
    );
  }
}
