import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/reports/data/models/show_report.dart';
import 'package:instant_project/features/tasks/data/models/todo_model.dart';

class TaskModel {
  final int id;
  final String name;
  final String? description;
  final String? note;
  final List<TodoModel>? toDoList;
  final DateTime createdAt;
  final TaskStatus status;
  final User? user;

  TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.note,
    required this.toDoList,
    required this.createdAt,
    required this.status,
    required this.user,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      name: map['task_name'],
      description: map['description'],
      note: map['note'],
      toDoList: map['to_do'] == null
          ? null
          : List<TodoModel>.from(
              map['to_do'].map((x) => TodoModel.fromMap(x)),
            ),
      createdAt: DateTime.parse(map['created_at']),
      status: TaskStatus.parse(map['status']),
      user: User.fromJson(map['user']),
    );
  }
}

enum TaskStatus {
  finished('Finished', AppColors.green),
  pending('pending', AppColors.orange),
  ;

  final String name;
  final Color color;
  const TaskStatus(this.name, this.color);

  static TaskStatus parse(String name) {
    return TaskStatus.values.firstWhere((element) => element.name == name);
  }
}
