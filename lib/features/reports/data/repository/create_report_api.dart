import 'package:dio/dio.dart';
import 'package:instant_project/core/network/dio_manager.dart';

class ApiService {
  static Future<bool> createReport(
      String reportName, String description) async {
    try {
      Response response = await DioManager.instance.post(
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
