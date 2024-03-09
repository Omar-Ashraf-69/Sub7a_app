

import 'package:flutter/material.dart';
import 'package:iste9far/constents.dart';

class TrackingLineWidget extends StatelessWidget {
  const TrackingLineWidget({
    super.key,
    required this.repetationNum,
    required this.label,
  });
  final int repetationNum;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            repetationNum.toString(),
            style: TextStyle(
              fontSize: 22,
              color: Color(hueColor),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 22,
              color: Color(hueColor),
            ),
          ),
        ],
      ),
    );
  }
}


