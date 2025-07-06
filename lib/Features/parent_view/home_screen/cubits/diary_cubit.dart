import 'dart:math';

import 'package:autism_app/Core/constants/app_constants.dart';
import 'package:autism_app/Core/models/diary_model.dart';
import 'package:autism_app/Core/remot/dio_helper.dart';
import 'package:autism_app/Features/parent_view/home_screen/cubits/diarystate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryCubit extends Cubit<DiaryState> {
  DiaryCubit() : super(DiaryInitial());
  DiaryResponseModel? diaryResponseModel;
  Future<void> getDiaryEntries() async {
    print(token);
    emit(DiaryLoading());
    try {
      await DioHelper.getData(
        url: 'diary/all',
      ).then((response) {
        if (response != null && response.statusCode == 200) {
          diaryResponseModel = DiaryResponseModel.fromJson(response.data);
          emit(DiaryLoaded(
              diaryResponseModel?.diaries)); // Replace with actual entries
        } else {
          emit(DiaryError('Failed to load diary entries'));
        }
      });
    } catch (e) {
      emit(DiaryError(e.toString()));
    }
  }

  Future<void> addDiaryEntry(String content) async {
    emit(DiaryLoading());
    try {
      await DioHelper.postData(
        url: 'diary/create',
        data: {"content": content},
      ).then((response) {
        print(response?.data);
        if (response != null && response.statusCode == 200) {
          getDiaryEntries();
          emit(DiaryAdded(
              response.data['message'])); // Emit success with message
          // Refresh entries after adding
        } else {
          emit(DiaryError('Failed to add diary entry'));
        }
      });
    } catch (e) {
      emit(DiaryError(e.toString()));
    }
  }

  Future<void> deleteDiaryEntry(int id) async {
    emit(DiaryLoading());
    try {
      await DioHelper.deleteData(
        url: 'diary/$id',
      ).then((response) {
        print(response?.data);
        if (response != null && response.statusCode == 200) {
          getDiaryEntries();
          emit(DiaryDeleted(
              response.data['message'])); // Emit success with message
          // Refresh entries after adding
        } else {
          emit(DiaryError('Failed to add diary entry'));
        }
      });
    } catch (e) {
      emit(DiaryError(e.toString()));
    }
  }

  Future<void> deleteAllDiaryEntry() async {
    emit(DiaryLoading());
    try {
      await DioHelper.deleteData(
        url: 'diary/all',
      ).then((response) {
        print(response?.data);
        if (response != null && response.statusCode == 200) {
          getDiaryEntries();
          emit(DiaryDeleted(
              response.data['message'])); // Emit success with message
          // Refresh entries after adding
        } else {
          emit(DiaryError('Failed to add diary entry'));
        }
      });
    } catch (e) {
      emit(DiaryError(e.toString()));
    }
  }

  Future<void> updateDiaryEntry(int id, String content) async {
    emit(DiaryLoading());
    try {
      await DioHelper.putData(
        url: 'diary/update/$id',
        data: {"content": content},
      ).then((response) {
        print(response?.data);
        if (response != null && response.statusCode == 200) {
          getDiaryEntries();
          emit(DiaryDeleted(
              response.data['message'])); // Emit success with message
          // Refresh entries after adding
        } else {
          emit(DiaryError('Failed to add diary entry'));
        }
      });
    } catch (e) {
      emit(DiaryError(e.toString()));
    }
  }
}
