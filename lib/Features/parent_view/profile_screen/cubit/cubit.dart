// profile_cubit.dart
import 'package:autism_app/Features/parent_view/profile_screen/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  // User model could be more complex in a real app
  Map<String, dynamic> userData = {
    'name': 'Michael Aryan',
    'email': 'michaelaryan434@gmail.com',
  };

  // Children data
  List<Map<String, dynamic>> children = [
    {
      'name': 'Maria',
      'avatar': 'assets/images/maria_avatar.png',
      'isPrimary': true,
    }
  ];

  void loadProfile() async {
    emit(ProfileLoading());

    try {
      // Simulate API call
      await Future.delayed(Duration(milliseconds: 500));
      emit(ProfileLoaded());
    } catch (e) {
      emit(ProfileError('Failed to load profile data'));
    }
  }

  void navigateToChildProfile(String childName) {
    // This will be used by the UI to navigate
    // The navigation itself will be handled in the UI layer
  }

  void addChild() {
    // Implementation for adding a child
  }
}
