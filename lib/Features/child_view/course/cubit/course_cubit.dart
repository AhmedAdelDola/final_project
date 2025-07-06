import 'package:autism_app/Core/models/course_model.dart';
import 'package:autism_app/Core/models/number_course_model.dart';
import 'package:autism_app/Core/models/quizemodel.dart';
import 'package:autism_app/Features/child_view/course/cubit/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:autism_app/Core/remot/dio_helper.dart';

// Cubit
class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  List<CourseModel>? courses;
  List<NumberCourseModel>? numbers;
  List<QuizModel>? quizzes;

  Future<void> fetchArCourses(String course) async {
    emit(CourseLoading());
    try {
      final response = await DioHelper.getData(url: 'letter/$course');
      if (response != null && response.data != null) {
        final List<dynamic>? data = response.data as List<dynamic>?;
        courses = data
            ?.map((e) => CourseModel.fromJson(e as Map<String, dynamic>?))
            .toList();
        emit(CourseLoaded(courses));
      } else {
        emit(CourseError('No courses found'));
      }
    } catch (e) {
      emit(CourseError('Failed to fetch courses'));
    }
  }

  Future<void> fetchNumbers() async {
    emit(numberLoading());
    try {
      final response = await DioHelper.getData(url: 'number');
      if (response != null && response.data != null) {
        final List<dynamic>? data = response.data as List<dynamic>?;
        numbers = data
            ?.map((e) => NumberCourseModel.fromJson(e as Map<String, dynamic>?))
            .toList();
        // You may want to create a new state for numbers, or reuse CourseLoaded
        emit(numberLoaded(
            numbers)); // Or create a new NumbersLoaded(numbers) state
      } else {
        emit(numberError('No numbers found'));
      }
    } catch (e) {
      emit(numberError('Failed to fetch numbers'));
    }
  }

  Future<void> fetchQuizzes() async {
    emit(quizLoading());
    try {
      final response = await DioHelper.getData(url: 'question/all');
      if (response != null && response.data != null) {
        final List<dynamic>? data = response.data as List<dynamic>?;
        quizzes = data
            ?.map((e) => QuizModel.fromJson(e as Map<String, dynamic>?))
            .toList();
        emit(quizLoaded(quizzes));
      } else {
        emit(quizError('No quizzes found'));
      }
    } catch (e) {
      emit(quizError('Failed to fetch quizzes'));
    }
  }
}
