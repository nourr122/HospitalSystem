import 'package:dio/dio.dart';
import 'package:instant_project/core/network/dio_manager.dart';
import 'package:instant_project/features/tasks/data/models/add_task_request_model.dart';
import 'package:instant_project/features/tasks/data/models/task_model_response_model.dart';
import 'package:instant_project/features/tasks/data/models/tasks_response_model.dart';
import 'package:intl/intl.dart';

class TasksRepository {
  TasksRepository();

  Future<TasksResponseModel> getTasksList({required DateTime date}) async {
    try {
      Map<String, dynamic> response = await DioManager.instance.getData(
        '/tasks',
        query: {
          "date": DateFormat('yyyy-MM-dd').format(date),
        },
      );

      if (response["status"] == 1) {
        return TasksResponseModel.fromMap(response);
      } else {
        throw Exception("Failed to fetch data");
      }
    } on DioException catch (e) {
      String errorMessage = "Retrieve failed";
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data["message"] ?? errorMessage;
      }
      throw Exception(errorMessage);
    }
  }

  Future<bool> addTask(AddTaskRequestModel requestModel) async {
    try {
      Map<String, dynamic> response = await DioManager.instance.postData(
        '/tasks',
        data: requestModel.toJson(),
      );

      if (response["status"] == 1) {
        return true;
      } else {
        throw Exception("Failed to add task");
      }
    } on DioException catch (e) {
      String errorMessage = "Retrieve failed";
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data["message"] ?? errorMessage;
      }
      throw Exception(errorMessage);
    }
  }

  Future<TaskModelResponseModel> getTaskDetails({required int id}) async {
    try {
      Map<String, dynamic> response = await DioManager.instance.getData(
        '/tasks/$id',
      );

      if (response["status"] == 1) {
        return TaskModelResponseModel.fromMap(response);
      } else {
        throw Exception("Failed to fetch data");
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
