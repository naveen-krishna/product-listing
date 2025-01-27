import 'package:dio/dio.dart';
import 'package:product_listing/core/constants/api_constants.dart';

class DioHelper {
  late Dio _dio;

  DioHelper({String baseUrl = baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10), // Connection timeout
      receiveTimeout: const Duration(seconds: 10), // Response timeout
      headers: {
        'Content-Type': 'application/json',
      },
    ));
  }

  /// GET Request
  Future<Response?> get(String endpoint,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
    return null;
  }

  /// POST Request
  Future<Response?> post(String endpoint,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
    return null;
  }

  /// PUT Request
  Future<Response?> put(String endpoint,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
    return null;
  }

  /// DELETE Request
  Future<Response?> delete(String endpoint,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
    return null;
  }

  /// Error Handler
  void _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        print("Connection timeout occurred.");
        break;
      case DioExceptionType.sendTimeout:
        print("Send timeout occurred.");
        break;
      case DioExceptionType.receiveTimeout:
        print("Receive timeout occurred.");
        break;
      case DioExceptionType.badResponse:
        print("Received invalid status code: ${e.response?.statusCode}");
        print("Response data: ${e.response?.data}");
        break;
      case DioExceptionType.cancel:
        print("Request was cancelled.");
        break;
      case DioExceptionType.connectionError:
        print("Connection error occurred: ${e.message}");
        break;
      default:
        print("An unknown error occurred: ${e.message}");
    }
  }

  /// Set custom headers
  void setHeaders(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }

  /// Clear headers
  void clearHeaders() {
    _dio.options.headers.clear();
  }
}
