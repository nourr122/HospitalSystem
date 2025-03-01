import 'package:instant_project/features/tasks/data/models/task_model.dart';

class TasksResponseModel {
  final int status;
  final String message;
  final List<TaskModel> data;

  TasksResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TasksResponseModel.fromMap(Map<String, dynamic> map) {
    return TasksResponseModel(
      status: map['status'],
      message: map['message'],
      data: List<TaskModel>.from(map['data'].map((x) => TaskModel.fromMap(x))),
    );
  }
}
