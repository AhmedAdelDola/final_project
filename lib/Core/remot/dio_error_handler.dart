import 'package:dio/dio.dart';

class DioErrorHandler {
  static String handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please try again.";
      case DioExceptionType.sendTimeout:
        return "Send timeout. Please try again.";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout. Please try again.";
      case DioExceptionType.badResponse:
        return "Received invalid status code: ${error.response?.statusCode}";
      case DioExceptionType.cancel:
        return "Request to API server was cancelled.";
      case DioExceptionType.unknown:
        return "Unexpected error occurred. Please check your connection.";
      default:
        return "Something went wrong. Please try again.";
    }
  }
}
