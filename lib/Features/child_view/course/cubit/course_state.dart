import 'package:autism_app/Core/models/course_model.dart';
import 'package:autism_app/Core/models/number_course_model.dart';
import 'package:autism_app/Core/models/quizemodel.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<CourseModel>? courses;
  CourseLoaded(this.courses);
}

class CourseError extends CourseState {
  final String message;
  CourseError(this.message);
}

class numberLoading extends CourseState {}

class numberLoaded extends CourseState {
  final List<NumberCourseModel>? number;
  numberLoaded(this.number);
}

class numberError extends CourseState {
  final String message;
  numberError(this.message);
}

class quizLoading extends CourseState {}

class quizLoaded extends CourseState {
  final List<QuizModel>? quiz;
  quizLoaded(this.quiz);
}

class quizError extends CourseState {
  final String message;
  quizError(this.message);
}
