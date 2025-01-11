// ignore_for_file: require_trailing_commas
import 'package:flutter/material.dart';

import 'package:hugeicons/hugeicons.dart';
import 'package:rephub/app/theme/palette.dart';
import 'package:rephub/core/enums/swipe_direction.dart';
import 'package:rephub/core/extensions/context_extensions.dart';
import 'package:rephub/features/dashboard/components/activity_action_button.dart';
import 'package:rephub/features/dashboard/components/strikethrough_overlay.dart';

class ActivityItem extends StatefulWidget {
  const ActivityItem({
    required this.title,
    required this.date,
    required this.icon,
    this.isCancelled = false,
    this.onCheckPressed,
    this.onDeletePressed,
    this.onCancel,
    super.key,
  });

  final String title;
  final DateTime date;
  final bool isCancelled;
  final IconData icon;
  final VoidCallback? onCheckPressed;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onCancel;

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  // Drag extent for the item
  var _dragExtent = 0.0;

  // Swipe direction for the item
  var _swipeDirection = SwipeDirection.none;

  // Whether the item is cancelled
  var _isCancelled = false;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    // Don't allow left swipe if item is cancelled
    if (_isCancelled && details.delta.dx < 0) {
      return;
    }

    // Whether the left swipe is active
    final isLeftSwipeActive = _swipeDirection == SwipeDirection.left;

    // Don't allow right swipe if left swipe is active
    if (isLeftSwipeActive && details.delta.dx > 0) {
      return;
    }

    setState(() {
      // Only allow left swipe to reset when in left swipe state
      if (isLeftSwipeActive && details.delta.dx >= 0) {
        return;
      }

      // Adjust 400 to control bounce stiffness
      var dampening = 1.0 - (_dragExtent.abs() / 400);

      // Prevent negative or zero dampening
      dampening = dampening.clamp(0.1, 1.0);

      // Apply dampening to the drag update
      _dragExtent += details.delta.dx * dampening;

      // Remove the clamp but keep a reasonable limit
      if (_dragExtent.abs() > 200) {
        _dragExtent = _dragExtent.sign * 200;
      }
    });
  }

  void _resetDirection() {
    setState(() => _swipeDirection = SwipeDirection.none);
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      // If we are not moving, do nothing
      if (_dragExtent == 0) {
        return;
      }

      // If we're already in left swipe state, reset to none
      if (_swipeDirection == SwipeDirection.left) {
        _swipeDirection = SwipeDirection.none;
        _dragExtent = 0;
        return;
      }

      _swipeDirection = switch (_dragExtent) {
        < 0 => SwipeDirection.left,
        > 0 => SwipeDirection.right,
        _ => SwipeDirection.none,
      };

      if (_swipeDirection == SwipeDirection.right) {
        _onCancel();
      }

      _dragExtent = 0;
    });
  }


  void _onCancel() {
    if (_isCancelled) {
      _isCancelled = false;
    } else {
      _isCancelled = true;
    }
  }

  void _onAction(VoidCallback? onPressed) {
    _resetDirection();
    onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: StrikethroughOverlay(
        isCancelled: _isCancelled,
        child: AnimatedContainer(
          height: 60,
          width: context.width,
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(_dragExtent, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: context.colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: switch (_isCancelled) {
              true => Colors.black.withOpacity(0.4),
              _ => Colors.transparent,
            },
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Leading icon and text
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.icon,
                    size: 32,
                    color: context.colorScheme.onPrimary,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.title,
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),

              // Trailing Widget
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: switch (_swipeDirection) {
                  SwipeDirection.left => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ActivityActionButton(
                          icon: HugeIcons.strokeRoundedDelete01,
                          onPressed: () => _onAction(widget.onDeletePressed),
                          color: AppPalette.red,
                          swipeDirection: _swipeDirection,
                        ),
                        ActivityActionButton(
                          icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                          onPressed: () => _onAction(widget.onCheckPressed),
                          color: AppPalette.green,
                          swipeDirection: _swipeDirection,
                        ),
                      ],
                    ),
                  _ => null,
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
