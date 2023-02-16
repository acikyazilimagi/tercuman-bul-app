import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';

class CustomExpandableCard extends StatelessWidget {
  final Widget topic;
  final Color backgrounColor;
  final bool centerIcon;
  final bool initialExpanded;
  final Widget content;

  const CustomExpandableCard({
    super.key,
    required this.topic,
    required this.content,
    required this.backgrounColor,
    this.centerIcon = false,
    this.initialExpanded = false,
  });
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      initialExpanded: initialExpanded,
      child: ScrollOnExpand(
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToExpand: true,
            tapBodyToCollapse: true,
            hasIcon: false,
          ),
          header: Container(
            color: backgrounColor,
            child: Row(
              crossAxisAlignment: centerIcon
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 16, left: 16, top: 16, bottom: 16),
                    child: topic,
                  ),
                ),
                Spacer(),
                ExpandableIcon(
                  theme: ExpandableThemeData(
                    collapseIcon: Icons.remove_circle_outline,
                    expandIcon: Icons.add_circle_outline,
                    iconColor: LightThemeColors().grey.shade400,
                    iconSize: 28.0,
                    iconRotationAngle: math.pi / 2,
                    iconPadding: EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
          ),
          collapsed: SizedBox(),
          expanded: Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16,
                        left: 16,
                        bottom: 16,
                        top: 0,
                      ),
                      child: content,
                    ),
                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
