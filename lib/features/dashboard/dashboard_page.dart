import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rephub/features/dashboard/dashboard_view.dart';

import 'package:rephub/features/dashboard/state/dashboard_cubit.dart';

import 'package:rephub/features/dashboard/state/dashboard_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocListener<DashboardCubit, DashboardState>(
        listener: (context, state) {
          // TODO(Prince): Implement listeners
        },
        child: const DashboardView(),
      ),
    );
  }
}
