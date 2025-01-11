import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rephub/features/dashboard/state/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void onDateChange(DateTime? selectedDate) {
    emit(state.copyWith(selectedDate: selectedDate));

    // Filter selected date by month and year
  }
}
