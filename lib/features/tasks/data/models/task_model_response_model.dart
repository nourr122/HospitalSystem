import 'package:instant_project/features/tasks/data/models/task_model.dart';

class TaskModelResponseModel {
  final int status;
  final String message;
  final TaskModel task;

  TaskModelResponseModel({
    required this.status,
    required this.message,
    required this.task,
  });

  factory TaskModelResponseModel.fromMap(Map<String, dynamic> map) {
    return TaskModelResponseModel(
      status: map['status'],
      message: map['message'],
      task: TaskModel.fromMap(map['data']),
    );
  }
}
