import 'package:instant_project/core/network/dio_manager.dart';
import 'package:instant_project/features/cases/data/models/nurseModel.dart';

import 'caseModel.dart';
import 'package:dio/dio.dart';

class ApiServer {
  Future<CaseModel> showCase({required String state}) async {
    try {
      Map<String, dynamic> response = await DioManager.instance.getData(
        '/case/4',
        query: {"status": state},
      );

      if (response['status'] == 1) {
        print('success request');
        print(response["data"]);
        return CaseModel.fromJson(response['data']);
      } else {
        print('no data');
        throw Exception("error ${response['message']}");
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
      Response response = await DioManager.instance.post(
        '/add-nurse',
        data: {"status": state},
      );

      if (response.data['status'] == 1) {
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
      Response response = await DioManager.instance.post(
        '/make-request',
        data: {
          "status": state,
        },
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
