import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  static final DioManager _instance = DioManager._();
  late Dio _dio;

  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  DioManager._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://hospital.elhossiny.net/api/v1",
        contentType: 'application/json',
        headers: {},
      ),
    );
    _dio.interceptors.add(PrettyDioLogger());
  }

  static DioManager get instance => _instance;

  Future<Map<String, dynamic>> getData(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    final response = await _dio.get(path, queryParameters: query);
    return response.data;
  }

  Future<Map<String, dynamic>> postData(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.post(path, data: FormData.fromMap(data));
    return response.data;
  }
}
