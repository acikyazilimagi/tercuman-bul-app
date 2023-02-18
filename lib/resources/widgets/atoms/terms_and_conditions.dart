import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class TermsAndConditions extends StatefulWidget {
  final Function() onClickedCb;

  const TermsAndConditions({super.key, required this.onClickedCb});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("consentForm".tr()),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              widget.onClickedCb();
            },
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft),
            child: Text("tos".tr()),
          ),
        ),
      ],
    );
  }
}
