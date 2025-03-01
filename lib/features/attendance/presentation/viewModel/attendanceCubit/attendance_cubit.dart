import 'package:bloc/bloc.dart';

import '../../../data/attendanceRepo.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final AttendanceRepository attendanceRepository;
  AttendanceCubit(this.attendanceRepository) : super(AttendanceInitial());


  Future<void> updateAttendance({required String state}) async {
    emit(AttendanceLoading());
    try {
      await attendanceRepository.setAttendance(state: state);
      emit(AttendanceSuccess("Attendance updated to $state", true));
    } catch (e) {
      emit(AttendanceFailure(e.toString()));
    }
  }
}
