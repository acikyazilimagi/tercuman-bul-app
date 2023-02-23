import 'package:flutter/material.dart';

import 'package:flutter_app/resources/widgets/atoms/atoms.dart';

class ContactLinkField extends StatelessWidget {
  final String hint;
  final IconData companyLogo;
  final TextEditingController? controller;
  final String title;

  const ContactLinkField(
      {Key? key,
      required this.hint,
      required this.companyLogo,
      required this.title,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: title,
      hint: hint,
      controller: controller,
      keyboardType: TextInputType.url,
      icon: Icon(companyLogo, size: 24),
      isDense: true,
      secondIcon: const Icon(Icons.help_outline, size: 16),
    );
  }
}
