import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    required this.color,
    this.onPressed,
  });
  final int color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(color),
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
    );
  }
}
