import 'package:dio/dio.dart';
import 'package:instant_project/core/network/dio_manager.dart';

class ReportRepository {
  Future<String> endReport(int reportId) async {
    try {
      Response response = await DioManager.instance.delete(
        "/reports/$reportId",
      );

      if (response.statusCode == 200) {
        return response.data["message"]; // Success Request
      } else {
        return "حدث خطأ أثناء إنهاء التقرير";
      }
    } catch (e) {
      return "فشل في الاتصال بالسيرفر: ${e.toString()}";
    }
  }
}
