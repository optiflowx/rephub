import 'package:flutter/widgets.dart';
import 'package:rephub/core/extensions/context_extensions.dart';
import 'package:rephub/features/dashboard/ui/strikethrough_painter.dart';

class StrikethroughOverlay extends StatefulWidget {
  const StrikethroughOverlay({
    required this.child,
    required this.isCancelled,
    super.key,
  });

  final Widget child;
  final bool isCancelled;

  @override
  State<StrikethroughOverlay> createState() => _StrikethroughOverlayState();
}

class _StrikethroughOverlayState extends State<StrikethroughOverlay>
    with SingleTickerProviderStateMixin {
  // Duration for the strikethrough animation
  final _animationDuration = const Duration(milliseconds: 250);

  // Controller for the strikethrough animation
  late final AnimationController _strikethroughController;
  late final Animation<double> _strikethroughAnimation;

  @override
  void initState() {
    super.initState();

    // Controller for the strikethrough animation
    _strikethroughController = AnimationController(
      vsync: this,
      duration: _animationDuration,
      reverseDuration: _animationDuration,
    );

    // Ease in to linear, then linear to ease out
    _strikethroughAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _strikethroughController,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _strikethroughController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(StrikethroughOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isCancelled) {
      _strikethroughController.forward();
    } else {
      _strikethroughController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        children: [
          widget.child,
          if (widget.isCancelled) ...[
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _strikethroughAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    willChange: true,
                    painter: StrikethroughPainter(
                      progress: _strikethroughAnimation.value,
                      color: context.theme.dividerColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
