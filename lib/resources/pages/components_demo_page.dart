import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/controller.dart';
import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';
import 'package:flutter_app/resources/widgets/atoms/atoms.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_button.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_expandable_card.dart';
import 'package:flutter_app/resources/widgets/molecules/contact_us_card.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ComponentsDemoPage extends NyStatefulWidget {
  final Controller controller = Controller();
  static final String path = "/demo";

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              iconButtons(),
              SizedBox(height: 20),
              textField(),
              SizedBox(height: 20),
              expandableCards(),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    "Contact Us Card",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  ContactUsCard(
                    title: 'Aradığınız cevabı bulamadınız mı?',
                    description: ' Lütfen destek ekibimize ulaşın.',
                    buttonText: 'İletişime Geç',
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Column expandableCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          "Expandable Card",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16),
        Text(
          "Initially Expanded Card",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomExpandableCard(
          initialExpanded: true,
          centerIcon: false,
          backgrounColor: LightThemeColors().background,
          topic: "Nasıl gönüllü tercüman olabilirim?",
          content: Text(
            "Gönüllü tercüman olmak için ilgili Tercümanbul platformunun kayıt"
            " formunu doldurup gerekli bilgileri ve tercüme deneyimini"
            " belirtmeniz gerekmektedir.",
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
        ),
      ],
    );
  }

  Widget textField() {
    return Column(
      children: [
        CustomTextField(
            title: "firstName".tr(), hint: "firstNameInputHelper".tr())
      ],
    );
  }

  Widget iconButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          "Icon Buttons - Block",
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
        SizedBox(height: 16),
        Text(
          "Icon Buttons - Normal",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16),
        Text(
          "Light Normal Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "Tercüman Ol",
          size: CustomButtonSize.normal,
          style: CustomButtonStyles.lightFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Dark Normal Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "Tercüman Ol",
          size: CustomButtonSize.normal,
          style: CustomButtonStyles.darkFilled,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        Text(
          "Disabled Normal Button",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        CustomButton(
          disabled: true,
          text: "Tercüman Ol",
          size: CustomButtonSize.normal,
          style: CustomButtonStyles.lightFilled,
          onPressed: () {},
        ),
      ],
    );
  }
}
