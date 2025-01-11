import 'package:flutter/material.dart';
import 'package:rephub/core/enums/facility_type.dart';
import 'package:rephub/features/medical_directory/widgets/resizable_tab_button.dart';

class MedicalFacilityTabBar extends StatelessWidget {
  const MedicalFacilityTabBar({
    required this.onFilterChanged,
    required this.filterValue,
    super.key,
  });

  final FacilityType filterValue;
  final void Function(FacilityType) onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: FacilityType.values.map((tab) {
          return ResizableTabButton(
            tab: tab,
            isActive: filterValue == tab,
            onTabSelected: onFilterChanged,
          );
        }).toList(),
      ),
    );
  }
}
