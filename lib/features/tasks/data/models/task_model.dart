import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/tasks/data/models/todo_model.dart';

class TaskModel {
  final String name;
  final String description;
  final List<TodoModel> toDoList;
  final DateTime date;
  final TaskStatus status;

  TaskModel({
    required this.name,
    required this.date,
    required this.status,
    required this.description,
    required this.toDoList,
  });
}

enum TaskStatus {
  finished('Finished', AppColors.green),
  processing('Processing', AppColors.orange),
  ;

  final String name;
  final Color color;
  const TaskStatus(this.name, this.color);
}

final testTasks = [
  TaskModel(
    name: 'Task 1',
    description: 'Description 1',
    toDoList: [
      TodoModel(
        name: 'Todo 1',
        isDone: true,
      ),
      TodoModel(
        name: 'Todo 2',
        isDone: false,
      ),
    ],
    date: DateTime.now().subtract(const Duration(days: 1)),
    status: TaskStatus.finished,
  ),
  TaskModel(
    name: 'Task 2',
    description: 'Description 2',
    toDoList: [
      TodoModel(
        name: 'Todo 1',
        isDone: true,
      ),
      TodoModel(
        name: 'Todo 2',
        isDone: false,
      ),
    ],
    date: DateTime.now().subtract(const Duration(days: 2)),
    status: TaskStatus.processing,
  ),
  TaskModel(
    name: 'Task 3',
    description: 'Description 3',
    toDoList: [
      TodoModel(
        name: 'Todo 1',
        isDone: true,
      ),
      TodoModel(
        name: 'Todo 2',
        isDone: false,
      ),
    ],
    date: DateTime.now().subtract(const Duration(days: 1)),
    status: TaskStatus.finished,
  ),
  TaskModel(
    name: 'Task 4',
    description: 'Description 4',
    toDoList: [
      TodoModel(
        name: 'Todo 1',
        isDone: true,
      ),
      TodoModel(
        name: 'Todo 2',
        isDone: false,
      ),
    ],
    date: DateTime.now().subtract(const Duration(days: 7)),
    status: TaskStatus.processing,
  ),
  TaskModel(
    name: 'Task 5',
    description: 'Description 5',
    toDoList: [
      TodoModel(
        name: 'Todo 1',
        isDone: true,
      ),
      TodoModel(
        name: 'Todo 2',
        isDone: false,
      ),
    ],
    date: DateTime.now().add(const Duration(days: 1)),
    status: TaskStatus.finished,
  ),
];
