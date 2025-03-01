import 'package:instant_project/features/cases/data/models/nurseModel.dart';

import 'caseModel.dart';
import 'package:dio/dio.dart';

class ApiServer {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://hospital.elhossiny.net/api/v1",
      contentType: 'application/json',
    ),
  );

  Future<CaseModel> showCase({required String state}) async {
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

      if (response.data['status'] == 1) {
        print('success request');
        print(response.data["data"]);
        return CaseModel.fromJson(response.data['data']);
      } else {
        print('no data');
        throw Exception("error ${response.data['message']}");
      }
    } on DioException catch (e) {
      String errorMessage = "Retrieve failed";
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data["message"] ?? errorMessage;
      }
      throw Exception(errorMessage);
    }
  }

  Future<NurseModel> AddNurse({required String state}) async {
    try {
      String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWI5YjBiMzU4NTA2ODVjOWQxZDg4NGYyMDU5YjIzMDg0NzViNzZjMzc1NmRmMTAwYTA5ZTk1OGQ4NmY4ZmMwNTc4ODRmMTJkODM5MTgwYzYiLCJpYXQiOjE3NDA1OTM2NTIuNjk1NjY3LCJuYmYiOjE3NDA1OTM2NTIuNjk1NjY4LCJleHAiOjE3NzIxMjk2NTIuNjk0NzAxLCJzdWIiOiIxMDEiLCJzY29wZXMiOltdfQ.JXSwbNjdrEouQAL-gM_9HwDgoA2qjCu97s2Ei71I2Er-H4D_y9UEqTC66iP_IV5D65h5wXIurJ_x-xWPa4stfz4MGMeo8ukPTgh_Z8fMGghEwjaYFiNIn4Lwi3gWPHClY51dNpi0sWN6peNqYF0tGST3u7_r-IBvTyl7jlLg4-8riywh5oYZViyfemGpDcQnX4pXeknl3b-LbiO72TawcMFEEFHJD46hSvYDkFf9Ek4BvPydvnEnAFm3IO0GIGleyLjYI0IhozN5GnoTHYqJi-QgahJjx8z32Z-yGeKhmAYWw93hqytCIJa9CDIw-hyoz_wFWK49QNwWxfOOGIBLu5OgRXfu7D_H6UTAurBqOTuW_HTT-_avojPvtiomWjHr2viy0TZNThGfQuny4TKwG2uYu1NRyiNHuTe1BkVytbbTzgo2KsdNWxR5cVuQYSapG3Rx-K8KLkltIgAElhQHA91-0g7N02flzUssyByvZSwmyD0Vy5V7OgVaer2yyc-BFnnCdsvXOl-Z-KaRf_76YHq-Uj_ytIbEdbDz2XqKyEXSzIUc-zKWg415F76V4gyXvto_vT8RKnHJAuQ1utygRBN-l0SqIOCjsTXayFRU_maJV5J8pzGtn0MKr3wzeN-oyTl1eq4DyF8jMEA7shoIUml5OMGNAK2vHmEwmzX5hQ0";

      Response response = await _dio.post(
        '/add-nurse',
        queryParameters: {"status": state},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.data['status'] == 1){
        print('success request');
        print(response.data["data"]);
        return NurseModel.fromJson(response.data['data']);

      } else {
        print('no data');
        throw Exception("error ${response.data['message']}");
      }
    } on DioException catch (e) {
      String errorMessage = "Retrieve failed";
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data["message"] ?? errorMessage;
      }
      throw Exception(errorMessage);
    }
  }
  Future<void> MakeRequest({required String state}) async {
  try {
  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTNiOTJjZWVjNzE2ZWNkZDMyZjE4NTlkZDQ2MjBkMGIyZGM2MjM4NTE2NmZhOGFjYTQ5MzVkZjQ0MzM1YjI4NWU0NTdhMzQyNWQ2ODVmMWYiLCJpYXQiOjE3NDA1MDIwNjEuNjgxNDQsIm5iZiI6MTc0MDUwMjA2MS42ODE0NDEsImV4cCI6MTc3MjAzODA2MS42ODA2NzIsInN1YiI6Ijg4Iiwic2NvcGVzIjpbXX0.SygBM6-9ZxXq41Tn7wx0hrIm0hKvNp0Tcr9bWNbNbOhrZpCi4pOjVdP-HkWB4Cn1BD3cg3RMTuwSqGesPIYbjHSkcyV9K9semeYL7fwa9f7T_QefvARYpR4ynyMBOJuTSM1gopbZZKRFnN_G2nV_s5M4OupIINYyRS7o63biPvxWGLm450Nh7yS9MveHKAqRljhMbrn8mk5pau3zEBlTo6BKnpFMAsoPA9YPDK3Sf9H1j9rB_S8DvtrazZq3Yn9mVmcytSpCrW5Klqvz_rIuZRC_4wosfZsw0IRNZ1frv4N_0BHmJ5SjWmej_alCkAUYzhvxDLallAgxcrFJ6Y8EfA8MV5tlE9v5xUrgSCbRdSVe6vwbbEFAg0X03mu9jnN9zanJqqR8JRQ2EzNfPX3CfhFqsLYqLScIbYV7_Woz1zdBfTnzXcstpHi2AFXof8Z9hiVZjapz6OmiMIpAeCrCsGPpGMWJWo_TsPSa83MesLAb3NOGO_I1DWXFEPxfYCm09JjqC6AlY9clAZOCOj-aVU7pMkiFWEpRnciU4zMmzSvOMi3d5LySaah0N2nyYEXBZwxWa1UEqRq94UOSxt8U2P7rbtQbSbBQ9iCRAioSnaLiNhnmvUOLmw3UBIGc3gMmKQYebBPIIa_s0DX7sJL6ptrrzl2lK-QBbriO4DbBjBc";
  Response response = await _dio.post(
  '/make-request',
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

}


