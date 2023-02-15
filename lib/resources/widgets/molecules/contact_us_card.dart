import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/atoms/custom_button.dart';

class ContactUsCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Function() onPressed;
  const ContactUsCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset('public/assets/images/avatar_group.png',
                width: 120,
                height: 56,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: CustomButton(
                text: buttonText,
                style: CustomButtonStyles.darkFilled,
                size: CustomButtonSize.normal,
                onPressed: onPressed,
              ),
            )
          ],
        ),
      ),
    );
  }
}
