import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

class CountryFlag extends StatelessWidget {
  final String code;
  final double height;

  CountryFlag({
    Key? key,
    required this.code,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flag.fromString(
      code,
      height: height,
      width: height * (4 / 3),
      fit: BoxFit.fill,
    );
  }
}