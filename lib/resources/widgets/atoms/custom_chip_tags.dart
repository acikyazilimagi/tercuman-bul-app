import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CustomChipTags extends StatefulWidget {
  final List<String> list;

  const CustomChipTags({
    super.key,
    required this.list,
  });

  @override
  State<CustomChipTags> createState() => _CustomChipTagsState();
}

class _CustomChipTagsState extends State<CustomChipTags> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChipTags(
        list: widget.list,
        chipColor: Colors.blue,
        iconColor: Colors.white,
        textColor: Colors.white,
        decoration: InputDecoration(
          hintText: "yourLanguage".tr(),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        createTagOnSubmit: true,
      ),
    );
  }
}
