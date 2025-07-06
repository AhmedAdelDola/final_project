import 'package:autism_app/Core/models/diary_model.dart';

abstract class DiaryState {}

class DiaryInitial extends DiaryState {}

class DiaryLoading extends DiaryState {}

class DiaryLoaded extends DiaryState {
  final List<DiaryModel>? diaryResponseModel;

  DiaryLoaded(this.diaryResponseModel);
}

class DiaryError extends DiaryState {
  final String message;
  DiaryError(this.message);
}

class DiaryAdded extends DiaryState {
  final String message;
  DiaryAdded(this.message);
}

class DiaryUpdated extends DiaryState {
  final String message;
  DiaryUpdated(this.message);
}

class DiaryDeleted extends DiaryState {
  final String message;
  DiaryDeleted(this.message);
}
