class DashboardState {
  DashboardState({
    this.selectedDate,
  });

  final DateTime? selectedDate;

  DashboardState copyWith({
    DateTime? selectedDate,
  }) {
    return DashboardState(
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}
