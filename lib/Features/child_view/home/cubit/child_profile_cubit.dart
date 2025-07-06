import 'package:autism_app/Features/child_view/home/cubit/child_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autism_app/Core/models/child_profile.dart';
import 'package:autism_app/Core/remot/dio_helper.dart';

// Cubit
class ChildInfoCubit extends Cubit<ChildInfoState> {
  ChildInfoCubit() : super(ChildProfileInitial());

  ChildProfile? childProfile;

  Future<void> fetchChildProfile() async {
    emit(ChildProfileLoading());
    try {
      final response = await DioHelper.getData(url: 'child');
      if (response != null && response.data != null) {
        childProfile = ChildProfile.fromJson(response.data);
        emit(ChildProfileLoaded(childProfile));
      } else {
        emit(ChildProfileError('No data found'));
      }
    } catch (e) {
      emit(ChildProfileError('Failed to fetch profile'));
    }
  }
}
