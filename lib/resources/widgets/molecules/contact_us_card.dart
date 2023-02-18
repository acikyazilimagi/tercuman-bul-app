import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_button.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsCard extends StatelessWidget {
  const ContactUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset(
                'public/assets/images/avatar_group.png',
                width: 120,
                height: 56,
              ),
            ),
            Text(
              "cantFind".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "reachSupport".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: CustomButton(
                text: "contactUsButton".tr(),
                style: CustomButtonStyles.darkFilled,
                size: CustomButtonSize.normal,
                onPressed: () async {
                  const email = "tercumanimol@gmail.com";
                  final mailUrl = Uri.parse("mailto:$email");
                  try {
                    await launchUrl(mailUrl);
                  } catch (e) {
                    await Clipboard.setData(const ClipboardData(text: email));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
