import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hint;
  final String helper;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.title,
    this.helper = "",
    required this.hint,
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.title,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: widget.keyboardType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
                fillColor: LightThemeColors().grey.shade300,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: Text(widget.hint),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperText: widget.helper),
          ),
        ]));
  }
}
