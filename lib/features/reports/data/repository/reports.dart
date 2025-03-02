import 'package:dio/dio.dart';
import 'package:instant_project/core/network/dio_manager.dart';
import '../models/reports_model.dart';

class ReportsRepository {
  Future<AllReports> getAllReports() async {
    try {
      Response response = await DioManager.instance.get(
        '/reports?date=',
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
