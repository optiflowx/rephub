import 'package:flutter/material.dart';

enum FacilityType {
  all(
    name: 'All',
    color: Colors.grey,
    borderColor: Colors.black,
    icon: Icons.all_inclusive,
  ),
  lenMed(
    name: 'LenMed Hospital',
    color: Colors.blue,
    borderColor: Colors.blueAccent,
    icon: Icons.local_hospital,
  ),
  netCare(
    name: 'NetCare Hospital',
    color: Colors.green,
    borderColor: Colors.greenAccent,
    icon: Icons.local_hospital,
  ),
  lifeHealth(
    name: 'Life Health Hospital',
    color: Colors.red,
    borderColor: Colors.redAccent,
    icon: Icons.local_hospital,
  ),
  publicHospital(
    name: 'Public Hospital',
    color: Colors.orange,
    borderColor: Colors.deepOrange,
    icon: Icons.local_hospital,
  ),
  privateHospital(
    name: 'Private Hospital',
    color: Colors.purple,
    borderColor: Colors.purpleAccent,
    icon: Icons.local_hospital,
  ),
  publicClinic(
    name: 'Public Clinic',
    color: Colors.yellow,
    borderColor: Colors.amber,
    icon: Icons.local_hospital,
  ),
  mediClinic(
    name: 'Medi-Clinic',
    color: Colors.cyan,
    borderColor: Colors.cyanAccent,
    icon: Icons.local_hospital,
  ),
  privateClinic(
    name: 'Private Clinic',
    color: Colors.pink,
    borderColor: Colors.pinkAccent,
    icon: Icons.local_hospital,
  );

  const FacilityType({
    required this.name,
    required this.color,
    required this.borderColor,
    required this.icon,
  });

  final String name;
  final Color color;
  final Color borderColor;
  final IconData icon;
}
