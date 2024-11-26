import 'package:rephub/core/enums/facility_type.dart';

class MedicalFacility {
  const MedicalFacility({
    required this.name,
    required this.telephone,
    required this.address,
    required this.type,
  });

  final String name;
  final String telephone;
  final String address;
  final FacilityType type;
}
