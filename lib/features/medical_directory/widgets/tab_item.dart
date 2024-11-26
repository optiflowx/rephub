// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:rephub/core/extensions/context_extensions.dart';
// import 'package:rephub/core/models/medical_facility.dart';

// class TabItem extends StatelessWidget {
//   const TabItem({
//     required this.facilityType,
//     required this.onTap,
//     required this.isActive,
//     super.key,
//   });

//   final FacilityType facilityType;
//   final bool isActive;
//   final void Function(FacilityType) onTap;

//   Color textColor(BuildContext context) {
//     return switch (isActive) {
//       true => switch (facilityType == FacilityType.all) {
//           true => context.colorScheme.surface,
//           false => Colors.white,
//         },
//       false => context.theme.dividerColor,
//     };
//   }

//   Color borderColor(BuildContext context) {
//     return switch (isActive) {
//       true => switch (facilityType == FacilityType.all) {
//           true => context.theme.dividerColor,
//           false => activeColor(context),
//         },
//       false => context.theme.dividerColor,
//     };
//   }

//   Color itemColor(BuildContext context) {
//     return switch (isActive) {
//       true => activeColor(context),
//       false => Colors.grey.withOpacity(.1),
//     };
//   }

//   Color activeColor(BuildContext context) {
//     return switch (facilityType) {
//       FacilityType.publicHospital => Colors.orange,
//       FacilityType.privateHospital => Colors.red,
//       FacilityType.publicClinic => Colors.green,
//       FacilityType.privateClinic => Colors.blue,
//       FacilityType.mediClinic => Colors.purple,
//       FacilityType.lenMed => Colors.teal,
//       FacilityType.netCare => Colors.pink,
//       _ => Colors.yellow,
//     };
//   }

//   IconData get icon {
//     return switch (facilityType) {
//       FacilityType.all => HugeIcons.strokeRoundedArchive02,
//       FacilityType.publicHospital ||
//       FacilityType.privateHospital =>
//         HugeIcons.strokeRoundedHospital02,
//       FacilityType.publicClinic ||
//       FacilityType.privateClinic ||
//       FacilityType.mediClinic =>
//         HugeIcons.strokeRoundedClinic,
//       _ => HugeIcons.strokeRoundedHospital01,
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onTap(facilityType),
//       child: AnimatedSize(
//         clipBehavior: Clip.antiAlias,
//         duration: const Duration(milliseconds: 650),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 600),
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 12,
//           ),
//           margin: const EdgeInsets.symmetric(horizontal: 4),
//           decoration: BoxDecoration(
//             color: switch (facilityType == FacilityType.all) {
//               false => itemColor(context).withOpacity(.5),
//               true => context.colorScheme.onSurface
//             },
//             border: Border.all(color: borderColor(context), width: 4),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 icon,
//                 color: textColor(context),
//               ),
//               if (isActive) ...[
//                 const SizedBox(width: 6),
//                 Text(
//                   facilityType.name,
//                   style: context.textTheme.bodyMedium!.apply(
//                     color: textColor(context),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
