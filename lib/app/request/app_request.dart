import 'package:dio/dio.dart';
import 'package:mall/app/settings/app_sys_config.dart';

class AppRequest {
  final Dio dio;

  AppRequest() : dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: REQUEST_CONNECT_TIME_OUT),
      receiveTimeout: const Duration(milliseconds: REQUEST_RECEIVE_TIME_OUT),
      sendTimeout: const Duration(milliseconds: REQUEST_SEND_TIME_OUT),
      baseUrl: BASE_URL,
      contentType: Headers.jsonContentType,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
        'Access-Control-Allow-Headers': '*',
      }
    ),
  ) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // options.headers['Authorization'] = 'Bearer YourAccessToken';
        return handler.next(options);
      },
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ));
  }

  Future<Response?> get(String apiPath, {Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await dio.get(apiPath, queryParameters: queryParameters);
      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } catch (error) {
      throw Exception('Failed to make GET request: $error');
    }
  }

  Future<Response?> post(String apiPath, {Map<String, dynamic>? data}) async {
    try {
      var response = await dio.post(apiPath, data: data);
      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } catch (error) {
      throw Exception('Failed to make POST request: $error');
    }
  }

  Future<Response?> put(String apiPath, {Map<String, dynamic>? data}) async {
    try {
      var response = await dio.put(apiPath, data: data);
      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } catch (error) {
      throw Exception('Failed to make POST request: $error');
    }
  }

  Future<void> delete(String apiPath, {dynamic id}) async {
    try {
      await dio.delete('$apiPath/$id');
    } catch (error) {
      throw Exception('Failed to make DELETE request: $error');
    }
  }

  Future<void> deleteMultiple(String apiPath, List<dynamic> ids) async {
    try {
      await dio.delete(apiPath, data: ids);
    } catch (error) {
      throw Exception('Failed to make DELETE multiple request: $error');
    }
  }
}
