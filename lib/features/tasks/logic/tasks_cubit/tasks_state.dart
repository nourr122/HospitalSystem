part of 'tasks_cubit.dart';

class TasksState {
  final bool loading;
  final List<TaskModel> tasks;
  final String? error;
  final DateTime? selectedDate;

  TasksState({
    this.loading = false,
    this.tasks = const [],
    this.error,
    this.selectedDate,
  });

  TasksState requestLoading() => copyWith(
        loading: true,
      );

  TasksState requestSuccess(TasksResponseModel response) => copyWith(
        loading: false,
        error: '',
        tasks: response.data,
      );

  TasksState copyWith({
    bool? loading,
    List<TaskModel>? tasks,
    String? error,
    DateTime? selectedDate,
  }) {
    return TasksState(
      loading: loading ?? this.loading,
      tasks: tasks ?? this.tasks,
      error: error ?? this.error,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}
