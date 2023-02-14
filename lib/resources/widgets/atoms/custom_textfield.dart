import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';

import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final String? helper;
  final bool isDense;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Widget? secondIcon;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.title,
    this.hint,
    this.controller,
    this.isDense = false,
    this.helper,
    this.validator,
    this.keyboardType,
    this.icon,
    this.secondIcon,
    this.fillColor,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? inputFormatters;

    // For blocking the spam things
    if (widget.keyboardType == TextInputType.name) {
      inputFormatters = <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z á-ú Á-Ú]")),
      ];
    }

    return Container(
      margin: EdgeInsets.only(bottom: context.calculateDynamicHeight(0.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title?.isNotEmpty == true) ...{
            Text(widget.title!),
            SizedBox(height: 10)
          },
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            inputFormatters: inputFormatters,
            validator: widget.validator,
            decoration: InputDecoration(
              isDense: widget.isDense,
              filled: true,
              fillColor: widget.fillColor != null
                  ? widget.fillColor
                  : LightThemeColors().grey.shade300,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              // label: Text(widget.hint,
              //     style: Theme.of(context)
              //         .textTheme
              //         .titleLarge
              //         ?.copyWith(fontWeight: FontWeight.w100)),
              hintText: widget.hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w100),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              helperText: widget.helper,
              prefixIcon: widget.icon,
              suffixIcon: widget.secondIcon,
            ),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
