import 'package:flutter/material.dart';
import 'package:rephub/core/extensions/context_extensions.dart';

import 'package:rephub/features/dashboard/components/activity_item.dart';

import 'package:rephub/features/dashboard/components/dashed_divider.dart';

class DashboardActivities extends StatelessWidget {
  const DashboardActivities({super.key});

  @override
  Widget build(BuildContext context) {
    const itemsCount = 10;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activities',
            style: context.textTheme.titleMedium,
          ),

          // Activities
          ...List.generate(
            itemsCount,
            (_) => ActivityItem(
              title: 'Activity',
              date: DateTime.now(),
              icon: Icons.check,
            ),
          ).asMap().entries.fold(
            <Widget>[],
            (previousValue, entry) => [
              ...previousValue,
              entry.value,
              if (entry.key < itemsCount - 1) const DashedDivider(),
            ],
          ),
        ],
      ),
    );
  }
}
