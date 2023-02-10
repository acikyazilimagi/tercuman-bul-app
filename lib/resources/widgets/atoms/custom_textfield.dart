import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String helper;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.title,
    required this.helper,
    this.keyboardType,
  });

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
      margin: EdgeInsets.only(bottom: 22),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(widget.title),
          helperText: widget.helper,
          helperMaxLines: 3,
        ),
      ),
    );
  }
}
