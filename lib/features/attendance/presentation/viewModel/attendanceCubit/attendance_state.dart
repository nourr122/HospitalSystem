part of 'attendance_cubit.dart';

abstract class AttendanceState {
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceSuccess extends AttendanceState {
  final String message;
  final bool isDone;
  AttendanceSuccess(this.message, this.isDone);

  @override
  List<Object> get props => [message];
}

class AttendanceFailure extends AttendanceState {
  final String error;
  AttendanceFailure(this.error);

  @override
  List<Object> get props => [error];
}