
// import 'package:flutter/material.dart';
// import 'package:instant_project/features/calls/specialist%20calls/data/models/Card_model.dart';

// @immutable
// sealed class GetAllCallsDoctorsState {}

// final class GetAllCallsDoctorsInitial extends GetAllCallsDoctorsState {}
// final class GetAllCallsDoctorsLoading extends GetAllCallsDoctorsState {}
// final class GetAllCallsDoctorsLoaded extends GetAllCallsDoctorsState {
//   final List<CardModel> calls;
//   GetAllCallsDoctorsLoaded({required this.calls});
  
// }
// final class GetAllCallsDoctorsErorr extends GetAllCallsDoctorsState {
//  final String errorMessage = 'Erorr Loading Calls';
// }


import 'package:flutter/material.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/Card_model.dart';

@immutable
sealed class GetAllCallsDoctorsState {}

final class GetAllCallsDoctorsInitial extends GetAllCallsDoctorsState {}
final class GetAllCallsDoctorsLoading extends GetAllCallsDoctorsState {}
final class GetAllCallsDoctorsLoaded extends GetAllCallsDoctorsState {
  final List<CardModel> calls;
  GetAllCallsDoctorsLoaded({required this.calls});
  
}
final class GetAllCallsDoctorsErorr extends GetAllCallsDoctorsState {
 final String errorMessage = 'Erorr Loading Calls';
}

