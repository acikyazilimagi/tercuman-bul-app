import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../themes/styles/light_theme_colors.dart';

class PhoneInput extends StatelessWidget {
  final String hint;
  final String? title;
  final bool enabled;
  final TextEditingController? controller;
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  const PhoneInput({
    Key? key,
    required this.hint,
    this.title,
    this.enabled = true,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.calculateDynamicHeight(0.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title?.isNotEmpty == true) ...{
            validator == null
                ? Text(title!)
                : Row(
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
            const SizedBox(height: 10)
          },
          IntlPhoneField(
            enabled: enabled,
            validator: validator,
            controller: controller,
            initialCountryCode: "TR",
            disableLengthCheck: true,
            flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              hintText: hint,
              fillColor: LightThemeColors().grey.shade300,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w100),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: const Icon(Icons.help_outline, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
