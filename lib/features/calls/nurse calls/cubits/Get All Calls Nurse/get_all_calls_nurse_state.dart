part of 'get_all_calls_nurse_cubit.dart';

@immutable
sealed class GetAllCallsNurseState {}

final class GetAllCallsNurseInitial extends GetAllCallsNurseState {}

final class GetAllCallsNurseLoading extends GetAllCallsNurseState {}

final class GetAllCallsNurseLoaded extends GetAllCallsNurseState {
  final List<CardModel> calls;
  GetAllCallsNurseLoaded({required this.calls});
}

final class GetAllCallsNurseError extends GetAllCallsNurseState {
  final String errorMessage = 'Error Loading Calls';
}
