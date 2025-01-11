import 'package:flutter/material.dart';
import 'package:rephub/core/extensions/context_extensions.dart';
import 'package:rephub/features/dashboard/components/dashboard_activities.dart';
import 'package:rephub/features/dashboard/components/dashboard_app_bar.dart';
import 'package:rephub/features/dashboard/components/dashboard_date_selection.dart';
import 'package:rephub/features/dashboard/components/dashboard_summary.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 75),
        child: DashboardAppBar(),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardDateSelection(),
            DashboardSummary(),
            DashboardActivities(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: context.colorScheme.onPrimary),
      ),
    );
  }
}
