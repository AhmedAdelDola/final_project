import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Features/parent_view/report_screen/cubit/state.dart';
import 'package:autism_app/Features/parent_view/report_screen/model/report_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());

  void loadReports(String tabType) async {
    emit(ReportLoading());

    try {
      // Simulate API call or database fetch
      await Future.delayed(Duration(seconds: 1));

      // Mock data for demo purpose
      List<Report> reports = [];

      if (tabType == "Notes") {
        reports = [
          Report(
            id: '1',
            name: 'Maria',
            date: 'Saturday, Nov 10',
            content: 'xxxxxxxxxxxxxxxxxxxxxxxxx',
            type: 'Notes',
            avatarUrl: AppImages.Maria,
          ),
          Report(
            id: '2',
            name: 'Maria',
            date: 'Saturday, Nov 10',
            content: 'xxxxxxxxxxxxxxxxxxxxxxxxx',
            type: 'Notes',
            avatarUrl: AppImages.Maria,
          ),
          Report(
            id: '3',
            name: 'Maria',
            date: 'Saturday, Nov 10',
            content: 'xxxxxxxxxxxxxxxxxxxxxxxxx',
            type: 'Notes',
            avatarUrl: AppImages.Maria,
          ),
        ];
      } else {
        // For "records" tab - no data shown in your example
        reports = [];
      }

      emit(ReportLoaded(reports: reports, selectedTab: tabType));
    } catch (e) {
      emit(ReportError(message: 'Failed to load reports: ${e.toString()}'));
    }
  }

  void deleteReport(String reportId) {
    if (state is ReportLoaded) {
      final currentState = state as ReportLoaded;
      final updatedReports = currentState.reports
          .where((report) => report?.id != reportId)
          .toList();

      emit(ReportLoaded(
        reports: updatedReports,
        selectedTab: currentState.selectedTab,
      ));
    }
  }

  void editReport(String reportId) {
    // Navigate to edit screen or show edit dialog
    // This would typically involve navigation which isn't handled in the Cubit
  }
}
