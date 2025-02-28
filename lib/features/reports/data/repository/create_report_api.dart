import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://hospital.elhossiny.net/api/v1';
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
  ));

  static Future<bool> createReport(String reportName, String description) async {
    try {
      Response response = await _dio.post(
        '/reports',
        data: {
          "report_name": reportName,
          "description": description,
        },
      );

      return response.data['status'] == 1;
    } catch (e) {
      print("❌ API Error: $e");
      return false;
    }
  }
}