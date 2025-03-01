part of 'get_all_calls_cubit.dart';

@immutable
sealed class GetAllCallsState {}

final class GetAllCallsInitial extends GetAllCallsState {}
final class GetAllCallsLoading extends GetAllCallsState {}
final class GetAllCallsLoaded extends GetAllCallsState {
  final List<CardModel> calls;
  GetAllCallsLoaded({required this.calls});
  
}
final class GetAllCallsErorr extends GetAllCallsState {
 final String errorMessage = 'Erorr Loading Calls';
}
