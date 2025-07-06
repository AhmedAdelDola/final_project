// child_profile_cubit.dart
import 'package:autism_app/Features/parent_view/profile_screen/widget/child_profile/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildProfileCubit extends Cubit<ChildProfileState> {
  final String childName;

  ChildProfileCubit(this.childName) : super(ChildProfileInitial()) {
    loadChildProfile();
  }

  // Child data (would come from a repository in a real app)
  Map<String, dynamic> childData = {
    'name': 'Maria',
    'avatar': 'assets/images/maria_avatar.png',
  };

  void loadChildProfile() async {
    emit(ChildProfileLoading());

    try {
      // Simulate API call
      await Future.delayed(Duration(milliseconds: 500));
      emit(ChildProfileLoaded());
    } catch (e) {
      emit(ChildProfileError('Failed to load child profile data'));
    }
  }
}
