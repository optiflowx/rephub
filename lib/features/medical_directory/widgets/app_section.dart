import 'package:flutter/material.dart';
import 'package:rephub/core/extensions/context_extensions.dart';

class AppSection extends StatelessWidget {
  const AppSection({
    required this.title,
    required this.child,
    this.onTrailingPressed,
    this.trailingIcon,
    super.key,
  });

  final String title;
  final Widget child;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: context.textTheme.titleSmall,
              ),
              if (trailingIcon != null) ...[
                const Spacer(),
                IconButton(
                  onPressed: onTrailingPressed,
                  icon: Icon(trailingIcon, size: 24),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
