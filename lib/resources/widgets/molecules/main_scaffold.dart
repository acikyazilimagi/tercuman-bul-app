import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

import 'main_app_bar.dart';
import 'main_bottom_navigation_bar.dart';

class MainScaffold extends StatelessWidget implements PreferredSizeWidget {
  final Widget body;
  final bool showBottomNavigationBar;
  final int selectedTabIndex;

  const MainScaffold({
    super.key,
    required this.body,
    this.showBottomNavigationBar = true,
    this.selectedTabIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: NyLocalization.instance.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: MainAppBar(),
        bottomNavigationBar: showBottomNavigationBar
            ? MainBottomNavigationBar(
                currentIndex: selectedTabIndex,
              )
            : null,
        body: SafeAreaWidget(child: body),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
