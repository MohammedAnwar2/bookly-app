import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            "Connection timed out. Please check your internet connection and try again.");
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            "Request timed out while sending data. Please try again later.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            "Request timed out while receiving data. Please try again.");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            "A certificate error occurred. Please ensure your connection is secure.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure("The request was canceled. Please try again.");
      case DioExceptionType.connectionError:
        return ServerFailure(
            "Failed to establish a connection. Please check your network and try again.");
      case DioExceptionType.unknown:
        return ServerFailure(
            "An unknown error occurred. Please try again later.");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(response['error']['message']);
      case 404:
        return ServerFailure(
            "The requested resource was not found. Please check the URL or try again later.");
      case 500:
        return ServerFailure("Internal server error. Please try again later.");
      default:
        return ServerFailure("There was an error , Please try again");
    }
  }
}
