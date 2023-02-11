import 'package:flutter/material.dart';

import '../../themes/styles/light_theme_colors.dart';

class CustomSelectableTile extends StatelessWidget {
  final String titleText;
  final bool isSelected;
  final void Function(bool isSele) onSelectStateChanged;
  const CustomSelectableTile({
    Key? key,
    required this.titleText,
    required this.isSelected,
    required this.onSelectStateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      dense: true,
      tileColor: Colors.transparent,
      value: isSelected,
      onChanged: onSelectStateChanged,
      activeColor: LightThemeColors().context,
      title: Text(titleText, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
