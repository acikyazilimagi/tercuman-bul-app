import 'package:flutter/material.dart';

import 'country_flag.dart';

class CountryFlagName extends StatelessWidget {
  final String code;
  final String name;

  CountryFlagName({
    Key? key,
    required this.code,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CountryFlag(code: code, height: 16),
        SizedBox(width: 8),
        Text(name),
      ],
    );
  }
}
