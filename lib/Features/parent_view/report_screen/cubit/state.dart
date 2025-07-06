// States
import 'package:autism_app/Features/parent_view/report_screen/model/report_model.dart';

abstract class ReportState {
  const ReportState();
}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportLoaded extends ReportState {
  final List<Report> reports;
  final String selectedTab;

  ReportLoaded({required this.reports, required this.selectedTab});
}

class ReportError extends ReportState {
  final String message;

  ReportError({required this.message});
}
