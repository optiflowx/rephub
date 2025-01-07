import 'package:flutter/material.dart';
import 'package:rephub/core/enums/facility_type.dart';

class ResizableTabButton extends StatelessWidget {
  const ResizableTabButton({
    required this.tab,
    required this.activeTab,
    required this.onTabSelected,
    super.key,
  });

  final FacilityType tab;
  final FacilityType activeTab;
  final void Function(FacilityType) onTabSelected;

  @override
  Widget build(BuildContext context) {
    final isActive = activeTab == tab;

    return GestureDetector(
      onTap: () {
        onTabSelected(tab);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: isActive ? 10 : 20),
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
