import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceRepository{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://hospital.elhossiny.net/api/v1",
      contentType: 'application/json',
      //connectTimeout: const Duration(seconds: 10),
      //receiveTimeout: const Duration(seconds: 10),
    ),
  );
  Future<void> setAttendance({required String state}) async {
    try {
      //String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTNiOTJjZWVjNzE2ZWNkZDMyZjE4NTlkZDQ2MjBkMGIyZGM2MjM4NTE2NmZhOGFjYTQ5MzVkZjQ0MzM1YjI4NWU0NTdhMzQyNWQ2ODVmMWYiLCJpYXQiOjE3NDA1MDIwNjEuNjgxNDQsIm5iZiI6MTc0MDUwMjA2MS42ODE0NDEsImV4cCI6MTc3MjAzODA2MS42ODA2NzIsInN1YiI6Ijg4Iiwic2NvcGVzIjpbXX0.SygBM6-9ZxXq41Tn7wx0hrIm0hKvNp0Tcr9bWNbNbOhrZpCi4pOjVdP-HkWB4Cn1BD3cg3RMTuwSqGesPIYbjHSkcyV9K9semeYL7fwa9f7T_QefvARYpR4ynyMBOJuTSM1gopbZZKRFnN_G2nV_s5M4OupIINYyRS7o63biPvxWGLm450Nh7yS9MveHKAqRljhMbrn8mk5pau3zEBlTo6BKnpFMAsoPA9YPDK3Sf9H1j9rB_S8DvtrazZq3Yn9mVmcytSpCrW5Klqvz_rIuZRC_4wosfZsw0IRNZ1frv4N_0BHmJ5SjWmej_alCkAUYzhvxDLallAgxcrFJ6Y8EfA8MV5tlE9v5xUrgSCbRdSVe6vwbbEFAg0X03mu9jnN9zanJqqR8JRQ2EzNfPX3CfhFqsLYqLScIbYV7_Woz1zdBfTnzXcstpHi2AFXof8Z9hiVZjapz6OmiMIpAeCrCsGPpGMWJWo_TsPSa83MesLAb3NOGO_I1DWXFEPxfYCm09JjqC6AlY9clAZOCOj-aVU7pMkiFWEpRnciU4zMmzSvOMi3d5LySaah0N2nyYEXBZwxWa1UEqRq94UOSxt8U2P7rbtQbSbBQ9iCRAioSnaLiNhnmvUOLmw3UBIGc3gMmKQYebBPIIa_s0DX7sJL6ptrrzl2lK-QBbriO4DbBjBc";
      String? token = await getToken();
      Response response = await _dio.post(
        '/attendance',
        data: {
          "status":state,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.data["status"] == 1) {
        print("state updated to $state");
      } else {
        throw Exception("Failed to fetch profile");
      }
    } on DioException catch (e) {
      String errorMessage = "Retrieve failed";
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data["message"] ?? errorMessage;
      }
      throw Exception(errorMessage);
    }
  }
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}