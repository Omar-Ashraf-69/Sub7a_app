import 'package:flutter/material.dart';
import 'package:iste9far/constents.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentIndicatorWidget extends StatelessWidget {
  const CircularPercentIndicatorWidget(
      {super.key,
      required this.precent,
      required this.counter,
      this.onPressed});
  final double precent;
  final int counter;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 35.0,
        bottom: 10,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: CircularPercentIndicator(
          radius: 100,
          animation: true,
          animateFromLastPercent: true,
          addAutomaticKeepAlive: true,
          percent: precent,
          center: Icon(
            Icons.touch_app,
            size: 50,
            color: Color(hueColor),
          ),
          backgroundColor: Color(hueColor).withOpacity(0.25),
          progressColor: Color(hueColor),
        ),
      ),
    );
  }
}
