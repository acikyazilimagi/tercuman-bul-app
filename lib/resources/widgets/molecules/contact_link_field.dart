import 'package:flutter/material.dart';

import 'package:flutter_app/resources/extensions/dynamic_size_extension.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';

class ContactLinkField extends StatelessWidget {
  final String hint;
  final IconData companyLogo;

  const ContactLinkField(
      {Key? key, required this.hint, required this.companyLogo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: "",
      hint: hint,
      keyboardType: TextInputType.url,
      icon: Icon(companyLogo, size: context.lowWidth),
      isDense: true,
      secondIcon: Icon(Icons.help_outline, size: context.lowWidth),
    );
  }
}
