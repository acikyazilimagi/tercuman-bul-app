import 'package:flutter/material.dart';

extension DynamicSizeExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  double calculateDynamicHeight(double percentage) =>
      (height * percentage) / 100;

  double calculateDynamicWidth(double percentage) => (width * percentage) / 100;

  double get veryLowHeight => calculateDynamicHeight(2);
  double get lowHeight => calculateDynamicHeight(5);
  double get normalHeight => calculateDynamicHeight(15);
  double get mediumHeight => calculateDynamicHeight(25);
  double get highHeight => calculateDynamicHeight(45);
  double get veryHighHeight => calculateDynamicHeight(60);

  double get veryLowWidth => calculateDynamicWidth(2);
  double get lowWidth => calculateDynamicWidth(5);
  double get normalWidth => calculateDynamicWidth(15);
  double get mediumWidth => calculateDynamicWidth(30);
  double get highWidth => calculateDynamicWidth(45);
  double get veryHighWidth => calculateDynamicWidth(60);
}
