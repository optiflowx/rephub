import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rephub/core/extensions/context_extensions.dart';

class DashboardSummary extends StatelessWidget {
  const DashboardSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RichText(
        text: _buildDefaultSpan(
          context: context,
          text: 'Good Morning, ',
          children: [
            ..._buildItemSpan(
              context,
              'Thandeka',
              shouldAddPeriod: true,
            ),
            _buildDefaultSpan(
              context: context,
              text: 'You have ',
            ),
            ..._buildItemSpan(
              context,
              '5 Surgical Appointments',
              icon: HugeIcons.strokeRoundedMedicalMask,
              shouldAddComma: true,
            ),
            ..._buildItemSpan(
              context,
              '2 Tasks',
              icon: HugeIcons.strokeRoundedTask01,
              shouldAddComma: true,
            ),
            ..._buildItemSpan(
              context,
              icon: HugeIcons.strokeRoundedMeetingRoom,
              '1 Meeting',
            ),
            _buildDefaultSpan(
              context: context,
              text: ' and ',
            ),
            ..._buildItemSpan(
              context,
              '1 Meeting',
              icon: HugeIcons.strokeRoundedCalendar01,
              shouldAddPeriod: true,
            ),
            _buildDefaultSpan(
              context: context,
              text: 'You will be free after ',
            ),
            ..._buildItemSpan(
              context,
              '5 PM',
              icon: HugeIcons.strokeRoundedTime01,
              shouldAddPeriod: true,
            ),
            _buildDefaultSpan(
              context: context,
              text: 'You will have to start planning for tomorrow soon!',
            ),
            ..._buildItemSpan(
              context,
              isSpecial: true,
              'I will send you a reminder!',
            ),
          ],
        ),
      ),
    );
  }

  List<InlineSpan> _buildItemSpan(
    BuildContext context,
    String? text, {
    IconData? icon,
    bool isSpecial = false,
    bool shouldAddPeriod = false,
    bool shouldAddComma = false,
  }) {
    final textStyle = context.textTheme.titleMedium?.copyWith(
      color: switch (isSpecial) {
        true => context.colorScheme.secondary,
        false => context.colorScheme.onPrimary,
      },
    );

    final punctuation = switch (shouldAddPeriod) {
      true => '.',
      false => shouldAddComma ? ',' : '',
    };

    return [
      if (icon != null) ...[
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Icon(icon, color: context.colorScheme.secondary),
        ),
      ],
      TextSpan(text: ' $text$punctuation ', style: textStyle),
    ];
  }

  InlineSpan _buildDefaultSpan({
    required BuildContext context,
    required String text,
    List<InlineSpan>? children,
  }) {
    return TextSpan(
      text: text,
      style: context.textTheme.titleMedium?.copyWith(
        color: Colors.grey,
      ),
      children: children,
    );
  }
}
