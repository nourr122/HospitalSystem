import 'dart:io';

import 'package:dio/dio.dart';

class AddTaskRequestModel {
  final String userId;
  final String taskName;
  final String description;
  final File? image;
  final List<String> todos;

  AddTaskRequestModel({
    required this.userId,
    required this.taskName,
    required this.description,
    required this.image,
    required this.todos,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'user_id': userId,
      'task_name': taskName,
      'description': description,
    };

    for (var i = 0; i < todos.length; i++) {
      map['todos[$i]'] = todos[i];
    }

    if (image != null) {
      map['image'] = MultipartFile.fromFile(image!.path);
    }
    return map;
  }
}
