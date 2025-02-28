import 'package:bloc/bloc.dart';
import 'package:instant_project/features/tasks/data/models/task_model.dart';
import 'package:instant_project/features/tasks/data/repository/tasks_repository.dart';

part 'tasks_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  late TasksRepository _tasksRepository;
  TaskDetailsCubit() : super(TaskDetailsState()) {
    _tasksRepository = TasksRepository();
  }

  void onIdChanged(int id) {
    emit(state.copyWith(selectedTask: id));

    _getTask();
  }

  void _getTask() async {
    emit(state.requestLoading());

    try {
      final result = await _tasksRepository.getTaskDetails(
        id: state.selectedTask ?? 0,
      );

      emit(state.requestSuccess(result.task));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
