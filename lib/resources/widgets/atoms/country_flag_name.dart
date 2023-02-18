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
        SizedBox(width: 8),
        Text(name, style: textStyle),
      ],
    );
  }
}
