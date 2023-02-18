import 'package:flutter/material.dart';
import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';

enum CustomButtonStyles { lightFilled, darkFilled }

enum CustomButtonSize { block, normal }

class CustomButton extends StatefulWidget {
  final String text;
  final void Function() onPressed;
  final CustomButtonStyles style;
  final IconData? icon;
  final CustomButtonSize size;
  final bool disabled;

  const CustomButton({
    Key? key,
    required this.text,
    required this.style,
    required this.onPressed,
    this.size = CustomButtonSize.block,
    this.disabled = false,
    this.icon,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _State();
}

class _State extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getButtonWidth(),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: getButtonBg(),
          foregroundColor: getButtonFg(),
          disabledBackgroundColor: Colors.grey.shade300,
        ),
        onPressed: widget.disabled ? null : widget.onPressed,
        icon: getIcon(),
        label: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.text,
            style: getTextStyle(),
          ),
        ),
      ),
    );
  }

  Color getButtonBg() {
    switch (widget.style) {
      case CustomButtonStyles.lightFilled:
        return LightThemeColors().grey.shade300;
      case CustomButtonStyles.darkFilled:
        return LightThemeColors().context;
    }
  }

  TextStyle getBaseTextStyle() {
    switch (widget.size) {
      case CustomButtonSize.block:
        return Theme.of(context).textTheme.titleLarge!;

      case CustomButtonSize.normal:
        return Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
            );
    }
  }

  TextStyle getTextStyle() {
    TextStyle baseTextStyle = getBaseTextStyle();

    switch (widget.style) {
      case CustomButtonStyles.lightFilled:
        Color color = LightThemeColors().context;
        if (widget.disabled) {
          color = LightThemeColors().grey.shade300;
        }
        return baseTextStyle.copyWith(color: color);

      case CustomButtonStyles.darkFilled:
        Color color = LightThemeColors().white;
        if (widget.disabled) {
          color = LightThemeColors().grey.shade300;
        }
        return baseTextStyle.copyWith(color: color);
    }
  }

  Widget getIcon() {
    if (null == widget.icon) return const SizedBox.shrink();
    switch (widget.style) {
      case CustomButtonStyles.lightFilled:
        Color color = LightThemeColors().context;
        if (widget.disabled) {
          color = LightThemeColors().grey.shade300;
        }
        return Icon(
          widget.icon,
          color: color,
        );

      case CustomButtonStyles.darkFilled:
        Color color = LightThemeColors().white;
        if (widget.disabled) {
          color = LightThemeColors().grey.shade300;
        }
        return Icon(
          widget.icon,
          color: color,
        );
    }
  }

  double? getButtonWidth() {
    switch (widget.size) {
      case CustomButtonSize.block:
        return double.infinity;

      case CustomButtonSize.normal:
        return null;
    }
  }

  Color? getButtonFg() {
    switch (widget.style) {
      case CustomButtonStyles.lightFilled:
        return LightThemeColors().grey;
      case CustomButtonStyles.darkFilled:
        return null;
    }
  }
}
