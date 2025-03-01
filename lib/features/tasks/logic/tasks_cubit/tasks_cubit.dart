import 'package:bloc/bloc.dart';
import 'package:instant_project/features/tasks/data/models/task_model.dart';
import 'package:instant_project/features/tasks/data/models/tasks_response_model.dart';
import 'package:instant_project/features/tasks/data/repository/tasks_repository.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  late TasksRepository _tasksRepository;
  TasksCubit() : super(TasksState()) {
    _tasksRepository = TasksRepository();
  }

  void onDateChanged(DateTime date) {
    emit(state.copyWith(selectedDate: date));

    _getTasks();
  }

  void _getTasks() async {
    emit(state.requestLoading());

    try {
      final result = await _tasksRepository.getTasksList(
          date: state.selectedDate ?? DateTime.now());

      emit(state.requestSuccess(result));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
