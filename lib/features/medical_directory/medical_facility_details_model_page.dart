import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rephub/core/extensions/context_extensions.dart';
import 'package:rephub/core/extensions/wolt_extensions.dart';
import 'package:rephub/core/models/medical_facility.dart';
import 'package:rephub/features/medical_directory/add_doctor_modal_page.dart';
import 'package:rephub/features/medical_directory/widgets/app_section.dart';
import 'package:rephub/features/medical_directory/widgets/details_item.dart';
import 'package:rephub/features/medical_directory/widgets/doctors_item.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage medicalFacilityDetailsModalPage({
  required BuildContext context,
  required MedicalFacility facility,
}) {
  return SliverWoltModalSheetPage(
    hasTopBarLayer: true,
    backgroundColor: context.colorScheme.surface,
    heroImage: Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://www.seguritecnia.es/wp-content/uploads/2022/11/gettyimages-898906302-900x600.jpg',
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 16,
          bottom: 8,
          width: context.width,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  facility.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    topBarTitle: Text(facility.name),
    mainContentSliversBuilder: (_) {
      return [
        SliverToBoxAdapter(
          child: AppSection(
            title: 'Details',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                DetailsItem(
                  title: 'Telephone:',
                  subtitle: facility.telephone,
                  icon: HugeIcons.strokeRoundedTelephone,
                ),
                DetailsItem(
                  title: 'Type:',
                  color: Colors.green,
                  subtitle: facility.type.name,
                  icon: HugeIcons.strokeRoundedMedicalFile,
                ),
                DetailsItem(
                  isFullWidth: true,
                  title: 'Address:',
                  subtitle: facility.address,
                  color: Colors.blueAccent,
                  icon: HugeIcons.strokeRoundedLocation01,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: AppSection(
            title: 'Doctors',
            trailingIcon: HugeIcons.strokeRoundedPlusSignCircle,
            onTrailingPressed: () => context.pushModalPage(
              AddDoctorModalPage(context),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(21, (_) {
                return const DoctorsItem();
              }),
            ),
          ),
        ),
      ];
    },
  );
}
