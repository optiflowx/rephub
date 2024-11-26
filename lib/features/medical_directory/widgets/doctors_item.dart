import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rephub/core/extensions/context_extensions.dart';

class DoctorsItem extends StatelessWidget {
  const DoctorsItem({
    this.isFullWidth = false,
    this.icon = Icons.more_vert,
    this.title = 'E.g. Dr. John Doe',
    this.speciality = 'E.g. Cardiologist',
    this.hospitalName,
    super.key,
  });

  final IconData icon;
  final String title;
  final String speciality;
  final String? hospitalName;
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
        // color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.primary,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 24,
            // backgroundColor: context.theme.primaryColor,
            child: Icon(
              HugeIcons.strokeRoundedDoctor01,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleSmall,
          ),
          Text(
            speciality,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
          ),
          if (hospitalName != null) ...[
            const SizedBox(height: 4),
            Text(
              hospitalName!,
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall?.copyWith(
                color: context.theme.primaryColor,
                fontSize: 13,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
