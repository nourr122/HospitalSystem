part of 'show_call_details_cubit.dart';

@immutable
sealed class ShowCallDetailsState {}

final class ShowCallDetailsInitial extends ShowCallDetailsState {}
final class ShowCallDetailsLoading extends ShowCallDetailsState {}
final class ShowCallDetailsLoaded extends ShowCallDetailsState {
  final CallDetailsModel callDetails;

  ShowCallDetailsLoaded({required this.callDetails});
}
final class ShowCallDetailsError extends ShowCallDetailsState {
  final String errorMessage = 'Error Loading Call Details';
}
