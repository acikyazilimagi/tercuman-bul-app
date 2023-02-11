import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_button.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class ComponentsDemoPage extends NyStatefulWidget {
  final Controller controller = Controller();
  ComponentsDemoPage({Key? key}) : super(key: key);

  @override
  _ComponentsDemoPageState createState() => _ComponentsDemoPageState();
}

class _ComponentsDemoPageState extends NyState<ComponentsDemoPage> {
  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components Demo"),
      ),
      body: SafeAreaWidget(
        child: Column(
          children: [iconButtons()],
        ),
      ),
    );
  }

  Widget iconButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          "Icon Buttons",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16),
        Text(
          "Dark Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "Tercüman Bul",
          icon: Icons.search_sharp,
          style: CustomButtonStyles.darkFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Dark Button Disabled",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          disabled: true,
          text: "Tercüman Bul",
          icon: Icons.search_sharp,
          style: CustomButtonStyles.darkFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Light Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "Tercüman Ol",
          icon: Icons.add_circle_outline_outlined,
          style: CustomButtonStyles.lightFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Light Button Disabled",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          disabled: true,
          text: "Tercüman Ol",
          icon: Icons.add_circle_outline_outlined,
          style: CustomButtonStyles.lightFilled,
          onPressed: () {},
        ),
      ],
    );
  }
}
