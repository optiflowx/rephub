import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rephub/core/enums/swipe_direction.dart';

class ActivityActionButton extends StatelessWidget {
  const ActivityActionButton({
    required this.icon,
    required this.onPressed,
    required this.color,
    required this.swipeDirection,
    super.key,
    this.delayMs = 200,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;
  final int delayMs;
  final SwipeDirection swipeDirection;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      manualTrigger: true,
      animate: swipeDirection != SwipeDirection.none,
      duration: const Duration(milliseconds: 400),
      delay: Duration(milliseconds: delayMs),
      curve: Curves.linearToEaseOut,
      controller: (controller) => switch (swipeDirection) {
        SwipeDirection.left => controller.forward(),
        _ => controller.reverse(),
      },
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 26, color: color),
      ),
    );
  }
}
