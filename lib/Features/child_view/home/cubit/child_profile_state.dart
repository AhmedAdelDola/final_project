import 'package:autism_app/Core/models/child_profile.dart';

abstract class ChildInfoState {}

class ChildProfileInitial extends ChildInfoState {}

class ChildProfileLoading extends ChildInfoState {}

class ChildProfileLoaded extends ChildInfoState {
  final ChildProfile? profile;
  ChildProfileLoaded(this.profile);
}

class ChildProfileError extends ChildInfoState {
  final String message;
  ChildProfileError(this.message);
}
