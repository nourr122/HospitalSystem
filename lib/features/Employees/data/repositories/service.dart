
import 'package:dio/dio.dart';
class APIService {
  Future<List<dynamic>> fetchEmployeesByType(String type, String token) async {
    Dio dio = Dio();
    final String apiUrl = 'https://hospital.elhossiny.net/api/v1/doctors';

    try {
      Response response = await dio.get(
        apiUrl,
        queryParameters: {'type': type},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
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