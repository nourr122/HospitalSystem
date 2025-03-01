import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:instant_project/features/tasks/data/models/add_task_request_model.dart';
import 'package:instant_project/features/tasks/data/repository/tasks_repository.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  late TasksRepository _tasksRepository;
  AddTaskCubit() : super(AddTaskState()) {
    _tasksRepository = TasksRepository();
  }

  void onNameChanged(String name) {
    emit(state.copyWith(taskName: name));
  }

  void onEmployeeSelected(String id) {
    emit(state.copyWith(employeeId: id));
  }

  void onDescriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void onImageChanged(File image) {
    emit(state.copyWith(file: image));
  }

  void onToDoAdded(String todo) {
    List<String> todos = state.todos ?? [];
    todos.add(todo);

    emit(state.copyWith(todos: [...todos]));
  }

  void onToDoRemoved(String todo) {
    List<String> todos = state.todos ?? [];
    todos.removeWhere((element) => element == todo);

    emit(state.copyWith(todos: [...todos]));
  }

  Future<bool> onAddTask() async {
    if (!state.isDataValid) return false;

    emit(state.requestLoading());

    try {
      await _tasksRepository.addTask(
        AddTaskRequestModel(
          taskName: state.taskName!,
          userId: state.employeeId!,
          description: state.description!,
          image: state.file,
          todos: state.todos!,
        ),
      );

      return true;
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
      return false;
    }
  }
}
