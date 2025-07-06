// child_profile_state.dart
abstract class ChildProfileState {}

class ChildProfileInitial extends ChildProfileState {}

class ChildProfileLoading extends ChildProfileState {}

class ChildProfileLoaded extends ChildProfileState {}

class ChildProfileError extends ChildProfileState {
  final String message;
  ChildProfileError(this.message);
}
