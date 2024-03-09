
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
      padding: const EdgeInsets.only(top: 20.0),
      child: CircularPercentIndicator(
        radius: 75,
        animation: true,
        animateFromLastPercent: true,
        addAutomaticKeepAlive: true,
        percent: precent,
        center: IconButton(
          onPressed:onPressed,
          icon: Icon(
            Icons.touch_app,
            size: 50,
            color: Color(hueColor),
          ),
        ),
        backgroundColor: Color(hueColor).withOpacity(0.25),
        progressColor: Color(hueColor),
      ),
    );
  }
}
