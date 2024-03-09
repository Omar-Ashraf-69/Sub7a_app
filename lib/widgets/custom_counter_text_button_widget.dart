import 'package:flutter/material.dart';
import 'package:iste9far/constents.dart';

class CustomCounterTextButton extends StatelessWidget {
  const CustomCounterTextButton({
    super.key,
    required this.number,
    this.onTap,
  });
  final String number;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            number,
            style: TextStyle(
              color: Color(hueColor),
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}