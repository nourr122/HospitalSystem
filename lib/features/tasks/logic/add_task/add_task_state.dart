part of 'add_task_cubit.dart';

class AddTaskState {
  final bool loading;
  final String? employeeId;
  final String? taskName;
  final String? description;
  final List<String>? todos;
  final File? file;
  final String? error;
  final bool taskAddedSuccess;

  AddTaskState({
    this.loading = false,
    this.employeeId,
    this.taskName,
    this.description,
    this.todos,
    this.file,
    this.error,
    this.taskAddedSuccess = false,
  });

  bool get isDataValid =>
      taskName != null &&
      employeeId != null &&
      description != null &&
      // file != null &&
      todos != null &&
      todos!.isNotEmpty;

  AddTaskState requestLoading() => copyWith(
        loading: true,
        error: null,
        taskAddedSuccess: false,
      );

  AddTaskState requestSuccess() => copyWith(
        loading: false,
        error: '',
        taskAddedSuccess: true,
      );

  AddTaskState copyWith({
    bool? loading,
    String? employeeId,
    String? taskName,
    String? selectedEmployee,
    String? description,
    List<String>? todos,
    File? file,
    String? error,
    bool? taskAddedSuccess,
  }) {
    return AddTaskState(
      loading: loading ?? this.loading,
      employeeId: employeeId ?? this.employeeId,
      taskName: taskName ?? this.taskName,
      description: description ?? this.description,
      todos: todos ?? this.todos,
      file: file ?? this.file,
      error: error ?? this.error,
      taskAddedSuccess: taskAddedSuccess ?? this.taskAddedSuccess,
    );
  }
}
