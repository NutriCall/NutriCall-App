import 'package:dio/dio.dart';

class DioErrorHandler {
  static Future<String> handleError(DioException e) async {
    if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return 'Unauthorized';
      } else if (e.response!.statusCode == 500) {
        return 'Internal server error';
      } else if (e.response!.statusCode == 404) {
        return 'Not found';
      } else {
        return 'HTTP Error: ${e.response!.statusCode}';
      }
    } else {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return 'Request timeout';
      } else if (e.type == DioExceptionType.cancel) {
        return 'Request cancelled';
      } else if (e.type == DioExceptionType.connectionError) {
        return 'Connection error';
      } else if (e.type == DioExceptionType.unknown) {
        return 'Dio Error: ${e.message}';
      } else {
        return 'Error: ${e.message}';
      }
    }
  }
}
