import 'package:dio/dio.dart';
import 'caseShow.dart';

class ApiServer {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://hospital.elhossiny.net/api/v1",
      contentType: 'application/json',
    ),
  );

  Future<List<dynamic>> fetchData({required String state}) async {
    try {
      String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWI5YjBiMzU4NTA2ODVjOWQxZDg4NGYyMDU5YjIzMDg0NzViNzZjMzc1NmRmMTAwYTA5ZTk1OGQ4NmY4ZmMwNTc4ODRmMTJkODM5MTgwYzYiLCJpYXQiOjE3NDA1OTM2NTIuNjk1NjY3LCJuYmYiOjE3NDA1OTM2NTIuNjk1NjY4LCJleHAiOjE3NzIxMjk2NTIuNjk0NzAxLCJzdWIiOiIxMDEiLCJzY29wZXMiOltdfQ.JXSwbNjdrEouQAL-gM_9HwDgoA2qjCu97s2Ei71I2Er-H4D_y9UEqTC66iP_IV5D65h5wXIurJ_x-xWPa4stfz4MGMeo8ukPTgh_Z8fMGghEwjaYFiNIn4Lwi3gWPHClY51dNpi0sWN6peNqYF0tGST3u7_r-IBvTyl7jlLg4-8riywh5oYZViyfemGpDcQnX4pXeknl3b-LbiO72TawcMFEEFHJD46hSvYDkFf9Ek4BvPydvnEnAFm3IO0GIGleyLjYI0IhozN5GnoTHYqJi-QgahJjx8z32Z-yGeKhmAYWw93hqytCIJa9CDIw-hyoz_wFWK49QNwWxfOOGIBLu5OgRXfu7D_H6UTAurBqOTuW_HTT-_avojPvtiomWjHr2viy0TZNThGfQuny4TKwG2uYu1NRyiNHuTe1BkVytbbTzgo2KsdNWxR5cVuQYSapG3Rx-K8KLkltIgAElhQHA91-0g7N02flzUssyByvZSwmyD0Vy5V7OgVaer2yyc-BFnnCdsvXOl-Z-KaRf_76YHq-Uj_ytIbEdbDz2XqKyEXSzIUc-zKWg415F76V4gyXvto_vT8RKnHJAuQ1utygRBN-l0SqIOCjsTXayFRU_maJV5J8pzGtn0MKr3wzeN-oyTl1eq4DyF8jMEA7shoIUml5OMGNAK2vHmEwmzX5hQ0";

      Response response = await _dio.get(
        '/case/4',
        queryParameters: {"status": state},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey('data') &&
            response.data['data'] is List) {
          return response.data['data'];
        } else {
          print("No Data Avaliable");
          return [];
        }
      } else {
        throw Exception("error ${response.statusCode}");
      }
    } catch (e) {
      print("error:$e");
      return [];
    }
  }
}
