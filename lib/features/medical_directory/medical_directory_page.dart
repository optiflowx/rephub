import 'package:flutter/material.dart';
import 'package:rephub/core/data/medical_facilities.dart';
import 'package:rephub/core/enums/facility_type.dart';
import 'package:rephub/core/extensions/context_extensions.dart';
import 'package:rephub/core/extensions/wolt_extensions.dart';
import 'package:rephub/core/models/medical_facility.dart';
import 'package:rephub/features/medical_directory/medical_facility_details_model_page.dart';
import 'package:rephub/features/medical_directory/widgets/facility_item.dart';
import 'package:rephub/features/medical_directory/widgets/medical_facility_tab_bar.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class MedServicesPage extends StatefulWidget {
  const MedServicesPage({super.key});

  @override
  State<MedServicesPage> createState() => _MedServicesPageState();
}

class _MedServicesPageState extends State<MedServicesPage> {
  String? searchValue;
  FacilityType filterValue = FacilityType.all;

  void onSearchChanged(String value) {
    setState(() => searchValue = value);
  }

  void onFilterChanged(FacilityType value) {
    setState(() => filterValue = value);
  }

  Iterable<MedicalFacility> get searchResults {
    if (searchValue == null || searchValue == '') return [];

    bool test(MedicalFacility facility) {
      final value = searchValue!.toLowerCase();

      final a = facility.name.toLowerCase().contains(value);

      if (filterValue != FacilityType.all) {
        final b = facility.type == filterValue;

        return a && b;
      }

      return a;
    }

    return medicalFacilities.where(test);
  }

  List<MedicalFacility> get filteredMedicalFacilities {
    if (filterValue != FacilityType.all) {
      return medicalFacilities
          .where((facility) => facility.type == filterValue)
          .toList();
    }

    return medicalFacilities;
  }

  Widget get searchResult {
    if (searchResults.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'You have no search results.\nType to find a medical facility.',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.apply(
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      itemCount: searchResults.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      separatorBuilder: (context, index) => Divider(
        color: context.theme.dividerColor,
        thickness: .5,
      ),
      itemBuilder: (context, index) => FacilityItem(
        facility: searchResults.elementAt(index),
        onTap: () => context.showWoltModalPage(
          (context) => [
            medicalFacilityDetailsModalPage(
              context: context,
              facility: searchResults.elementAt(index),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      appBar: SuperAppBar(
        title: Text(
          'Medical Facilities',
          style: context.textTheme.titleSmall,
        ),
        largeTitle: SuperLargeTitle(
          largeTitle: 'Medical Facilities',
          textStyle: context.textTheme.titleLarge!,
        ),
        searchBar: SuperSearchBar(
          searchResult: searchResult,
          onChanged: onSearchChanged,
          cancelTextStyle: context.textTheme.bodyMedium!.apply(
            color: context.theme.primaryColor,
          ),
        ),
        bottom: SuperAppBarBottom(
          enabled: true,
          height: 68,
          child: MedicalFacilityTabBar(
            filterValue: filterValue,
            onFilterChanged: onFilterChanged,
          ),
        ),
        backgroundColor: context.colorScheme.surface.withOpacity(0.65),
      ),
      body: ListView.separated(
        itemCount: filteredMedicalFacilities.length,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        separatorBuilder: (context, index) => Divider(
          color: context.theme.dividerColor,
          thickness: .5,
        ),
        itemBuilder: (context, index) => FacilityItem(
          facility: filteredMedicalFacilities[index],
          onTap: () => context.showWoltModalPage(
            (context) => [
              medicalFacilityDetailsModalPage(
                context: context,
                facility: medicalFacilities[index],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
