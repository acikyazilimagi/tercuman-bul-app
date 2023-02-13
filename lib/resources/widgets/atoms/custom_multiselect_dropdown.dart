import 'package:diacritic/diacritic.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';

class CustomMultiselectDropdown<T> extends StatefulWidget {
  final String? title;
  final String? hint;
  final List<T> items;
  final String Function(T)? itemAsString;
  final Widget Function(BuildContext, T, bool)? itemBuilder;
  final bool showSearchBox;
  final bool isDense;
  final String? helper;
  final Widget? icon;
  final Widget? secondIcon;
  final Color? fillColor;
  final String? Function(List<T>?)? validator;
  final void Function(List<T>)? onChanged;

  const CustomMultiselectDropdown({
    Key? key,
    this.title,
    this.hint,
    this.items = const [],
    this.itemAsString,
    this.itemBuilder,
    this.showSearchBox = false,
    this.isDense = false,
    this.helper,
    this.icon,
    this.secondIcon,
    this.fillColor,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomMultiselectDropdown> createState() =>
      _CustomMultiselectDropdownState<T>();
}

class _CustomMultiselectDropdownState<T>
    extends State<CustomMultiselectDropdown<T>> {
  List<T> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title?.isNotEmpty == true) ...{
          Text(widget.title!),
          SizedBox(height: 10)
        },
        DropdownSearch<T>.multiSelection(
          items: widget.items,
          itemAsString: widget.itemAsString,
          filterFn: (item, filter) =>
              removeDiacritics(widget.itemAsString!(item).toLowerCase())
                  .contains(removeDiacritics(filter).toLowerCase()),
          popupProps: PopupPropsMultiSelection.menu(
            showSearchBox: widget.showSearchBox,
            itemBuilder: widget.itemBuilder,
            onItemAdded: (selectedItems, addedItem) =>
                setState(() => this.selectedItems = selectedItems),
            onItemRemoved: (selectedItems, removedItem) =>
                setState(() => this.selectedItems = selectedItems),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              isDense: widget.isDense,
              filled: true,
              fillColor: widget.fillColor != null
                  ? widget.fillColor
                  : LightThemeColors().grey.shade300,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
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
          ),
          validator: widget.validator,
          onChanged: widget.onChanged,
          selectedItems: selectedItems,
        ),
      ],
    );
  }
}
