import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rephub/core/extensions/context_extensions.dart';
import 'package:rephub/features/dashboard/state/dashboard_cubit.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  Widget _buildTrailingText(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.titleSmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = context.select(
      (DashboardCubit cubit) => cubit.state.selectedDate,
    );

    final dayName = EasyDateFormatter.shortDayName(
      selectedDate ?? DateTime.now(),
      'en_US',
    ).toUpperCase();

    final monthName = EasyDateFormatter.fullMonthName(
      selectedDate ?? DateTime.now(),
      'en_US',
    ).toUpperCase();

    final year = selectedDate?.year.toString();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      dayName,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: context.colorScheme.primary,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildTrailingText(context, monthName),
                    _buildTrailingText(context, year ?? ''),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
