import 'package:flutter/material.dart';
import 'package:rephub/core/enums/facility_type.dart';

class ResizableTabButton extends StatelessWidget {
  const ResizableTabButton({
    required this.tab,
    required this.isActive,
    required this.onTabSelected,
    this.isBeforeActive = false,
    this.isAfterActive = false,
    super.key,
  });

  final FacilityType tab;
  final bool isActive;
  final bool isBeforeActive;
  final bool isAfterActive;
  final void Function(FacilityType) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTabSelected(tab),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 10 : 20,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: tab.color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              tab.icon,
              color: Colors.white,
            ),
            if (isActive)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  tab.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
