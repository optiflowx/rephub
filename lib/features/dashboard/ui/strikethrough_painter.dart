import 'package:flutter/widgets.dart';

class StrikethroughPainter extends CustomPainter {
  StrikethroughPainter({
    required this.progress,
    required this.color,
  });

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final start = Offset(0, size.height / 2);
    final end = Offset(size.width * progress, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(StrikethroughPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
