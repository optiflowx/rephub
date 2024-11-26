import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rephub/core/extensions/context_extensions.dart';

import 'package:rephub/features/dashboard/dashboard_page.dart';
import 'package:rephub/features/medical_directory/medical_directory_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navIndex = 0;

  void setNavIndex(int index) {
    setState(() => navIndex = index);
  }

  final pages = const [
    DashboardPage(),
    MedServicesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[navIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: setNavIndex,
        unselectedItemColor: context.theme.dividerColor,
        selectedItemColor: context.theme.primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(HugeIcons.strokeRoundedHome01),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(HugeIcons.strokeRoundedMedicalFile),
            label: 'Medical Facilities',
          ),
        ],
      ),
    );
  }
}
