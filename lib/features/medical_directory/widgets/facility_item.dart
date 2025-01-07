import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rephub/core/enums/facility_type.dart';
import 'package:rephub/core/extensions/context_extensions.dart';
import 'package:rephub/core/models/medical_facility.dart';

class FacilityItem extends StatelessWidget {
  const FacilityItem({
    required this.facility,
    required this.onTap,
    super.key,
  });

  final MedicalFacility facility;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Icon(
              switch (facility.type) {
                FacilityType.mediClinic ||
                FacilityType.privateClinic =>
                  HugeIcons.strokeRoundedClinic,
                FacilityType.publicHospital ||
                FacilityType.privateHospital =>
                  HugeIcons.strokeRoundedHospital01,
                _ => HugeIcons.strokeRoundedHospital02,
              },
              color: Colors.grey,
              size: 45,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  facility.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall,
                ),
                Text(
                  facility.address,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(HugeIcons.strokeRoundedArrowRight01),
        ],
      ),
    );
  }
}
