import 'package:dio/dio.dart';
import '../models/reports_model.dart';

class ReportsRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://hospital.elhossiny.net/api/v1",
      contentType: 'application/json',
    ),
  );

  Future<AllReports> getAllReports() async {
    try {
      String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODJlYjI0MWNkOTEzYWMwNGEzNjQ3MzRmNjgzYmI2MjAzNTkwZjk0NjMzZTZmYmJlZDY2YTVlOWZiYzg5NWZiZTIyYjNiYzc1OGRjNmRlYWEiLCJpYXQiOjE3NDAwMDQ3NjEuNTM1MzQ0LCJuYmYiOjE3NDAwMDQ3NjEuNTM1MzQ2LCJleHAiOjE3NzE1NDA3NjEuNTMzMDg1LCJzdWIiOiIzNSIsInNjb3BlcyI6W119.aW2V4Z1ZyO01o3r42Of1bGMa5tSZua3Ae-EAA_C7L-UMBIOD29YNML9-oaoBhuUzKBBHEOSyEd_9TdTBzSu_phI_4FGJyTyKkDZMlDAXo7i54iqk5mM38Voipcwm7ZMV5JZMnX7dbSHTNOGmFawN1EJijAV_8OMDIsgLkrcCxKhtIe5sDff4zDdFjaQPCyt8iqom-g-9bTFsIWYMMVLgp6kIymHgGDeaBtoJdcjFebu7Wg0DG6qPpxWqJm-jfQPBq84attG7J8YSYMXlvJ7A0fAqp12jVZh6QKKT9DO_CGSzCJqNhbjWvcXsEMtdZ5-MmI4XzdyJifjIoEc9Zvg8aJgUQ6MbH6U_dvGMHb3rkMzctPIxY_KZuw1l5ZF7lzaf-6GgW7hSEGudP2vXKtSsMx8qU3THQNvu1RwShJdO5IAfCo5WEZ0awLsle_zOeGbwnRksE_ddiN4fd2UPcJz14GnreuwQTo45DJX2nNqEzHb-1XhYEqz_cwnFp8tSnaj5VqviBM4I21qRzrfC9gpOWa5gyb97fkt_dc5cFXL7q-M8TSuowasJar2EUkTmJT7hWUq5ci089rUP2Uj69HEnifRl_tiCHWDJoqZyyvJ8w6SgK97yhLZr8NUYcHm_YbzgBewLEY97qjvMaR1UB-b269P1hNo-YhLCW4y24-BrSVY";

      Response response = await _dio.get(
        '/reports?date=',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.data["status"] == 1) {
        return AllReports.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch reports");
      }
    } on DioException catch (e) {
      String errorMessage = "Retrieve failed";
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data["message"] ?? errorMessage;
      }
      throw Exception(errorMessage);
    }
  }
}