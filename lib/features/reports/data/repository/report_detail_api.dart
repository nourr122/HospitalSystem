import 'package:dio/dio.dart';
import 'package:instant_project/core/network/dio_manager.dart';
import '../models/show_report.dart';

class ReportDetailsRepository {
  Future<ReportDetail> getReportDetails(int reportId) async {
    try {
      Response response = await DioManager.instance.get(
        '/reports/$reportId',
      );

      if (response.data["status"] == 1) {
        return ReportDetail.fromJson(response.data); // استخدام ReportDetail
      } else {
        throw Exception("Failed to fetch report details");
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
