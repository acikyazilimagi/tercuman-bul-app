import 'package:flutter/material.dart';

import '../../themes/styles/light_theme_colors.dart';

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
  String _value = 'TR';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: LightThemeColors().grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: LightThemeColors().grey.shade300, width: 2),
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
      items: widget.countryData?.map(
        (e) => DropdownMenuItem(
          value: e["code"].toString(),
          child: Text(e["dialling_code"] + " " + e["name"]),
        ),
      ).toList(),
    );
  }
}
