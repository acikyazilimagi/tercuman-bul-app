import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Kvkk extends StatefulWidget {
  const Kvkk({super.key});

  @override
  State<Kvkk> createState() => _KvkkState();
}

class _KvkkState extends State<Kvkk> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromRGBO(34, 58, 82, 1)),
            checkColor: Colors.white,
            title: Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () => openDialog(),
                      child: const Text(
                        "Aydınlatma Metni",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
                  const TextSpan(
                      text: "'ni okudum ve kabul ediyorum.",
                      style: TextStyle(
                        color: Color.fromRGBO(34, 58, 82, 1),
                      )),
                ],
              ),
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.start,
            ),
            value: tcCheckbox,
            onChanged: (bool? value) {
              setState(() {
                tcCheckbox = value!;
              });
            }),
        CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromRGBO(34, 58, 82, 1)),
            checkColor: Colors.white,
            title: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "truthAck".tr(),
                      style: const TextStyle(
                        color: Color.fromRGBO(34, 58, 82, 1),
                      )),
                ],
              ),
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.start,
            ),
            value: truthAckCheckbox,
            onChanged: (bool? value) {
              setState(() {
                truthAckCheckbox = value!;
              });
            }),
      ],
    );
  }

  bool tcCheckbox = false;
  bool truthAckCheckbox = false;
  Future openDialog() => showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              icon: IconButton(
                alignment: Alignment.topRight,
                icon: const Icon(MdiIcons.close),
                onPressed: () => Navigator.pop(context),
              ),
              content: SingleChildScrollView(
                child: Text("tcpp".tr()),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("I Accept!"),
                    Checkbox(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromRGBO(34, 58, 82, 1)),
                        checkColor: Colors.white,
                        value: tcCheckbox,
                        onChanged: (bool? value) {
                          setState(() {
                            tcCheckbox = value!;
                          });
                          Navigator.pop(context);
                        }),
                  ],
                )
              ],
            )),
      );
}
