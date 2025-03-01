
import 'package:flutter/material.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/doctor_model.dart';

@immutable
sealed class GetAllDoctorssState {}

final class GetAllDoctorsInitial extends GetAllDoctorssState {}
final class GetAllDoctorsLoading extends GetAllDoctorssState {}
final class GetAllDoctorsLoaded extends GetAllDoctorssState {
  final List<DoctorModel> doctors;
  GetAllDoctorsLoaded({required this.doctors});
  
}
final class GetAllDoctorsErorr extends GetAllDoctorssState {
 final String errorMessage = 'Erorr Loading Doctors';
}
