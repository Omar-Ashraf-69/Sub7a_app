
import 'package:flutter/material.dart';
import 'package:iste9far/constents.dart';

class RaidoWidget extends StatelessWidget {
  const RaidoWidget({super.key, required this.radioValue, this.onChanged});
  final int radioValue;
  final void Function(int?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Radio(
      value: radioValue,
      overlayColor: MaterialStatePropertyAll(
        Color(radioValue),
      ),
      fillColor: MaterialStatePropertyAll(
        Color(radioValue),
      ),
      groupValue: hueColor,
      toggleable: true,
      onChanged: onChanged,
    );
  }
}
