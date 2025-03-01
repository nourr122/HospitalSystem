part of 'task_details_cubit.dart';

class TaskDetailsState {
  final bool loading;
  final TaskModel? task;
  final String? error;
  final int? selectedTask;

  TaskDetailsState({
    this.loading = false,
    this.task,
    this.error,
    this.selectedTask,
  });

  TaskDetailsState requestLoading() => copyWith(
        loading: true,
      );

  TaskDetailsState requestSuccess(TaskModel task) => copyWith(
        loading: false,
        error: '',
        task: task,
      );

  TaskDetailsState copyWith({
    bool? loading,
    TaskModel? task,
    String? error,
    int? selectedTask,
  }) {
    return TaskDetailsState(
      loading: loading ?? this.loading,
      task: task ?? this.task,
      error: error ?? this.error,
      selectedTask: selectedTask ?? this.selectedTask,
    );
  }
}
