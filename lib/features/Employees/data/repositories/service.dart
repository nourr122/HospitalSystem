import 'package:dio/dio.dart';
import 'package:instant_project/core/network/dio_manager.dart';

class APIService {
  Future<List<dynamic>> fetchEmployeesByType(String type) async {
    try {
      Response response = await DioManager.instance.get(
        '/doctors',
        query: {'type': type},
      );

      if (response.statusCode == 200) {
        print(response.data['data']);
        return response.data['data'];
      } else {
        print("Failed to load employees: ${response.statusCode}");
        return [];
      }
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      if (e.response != null) {
        print("Error Data: ${e.response?.data}");
      }
      return [];
    } catch (e) {
      print("Unexpected error: $e");
      return [];
    }
  }
}
