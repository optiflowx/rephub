
import 'package:flutter/material.dart';
import 'package:rephub/core/extensions/context_extensions.dart';

class DashedDivider extends StatelessWidget {
  const DashedDivider({super.key});

  Widget _buildDash(BuildContext context, double width) {
    return Container(
      height: 1,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: context.theme.dividerColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemsCount = ((context.width / 15) - 12).ceil();

    const itemsWidth = 10.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        itemsCount,
        (_) => _buildDash(context, itemsWidth),
      ),
    );
  }
}
