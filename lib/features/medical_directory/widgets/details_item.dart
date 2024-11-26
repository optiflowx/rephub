import 'package:flutter/material.dart';
import 'package:rephub/core/extensions/context_extensions.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({
    this.isFullWidth = false,
    this.color = Colors.red,
    this.icon = Icons.more_vert,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
    super.key,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final itemWidth = switch (isFullWidth) {
      true => context.width,
      false => context.width / 2 - 16,
    };

    return Container(
      width: itemWidth,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleSmall,
              ),
              Text(
                subtitle,
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(icon, size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
