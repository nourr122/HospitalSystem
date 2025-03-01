import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:instant_project/features/calls/specialist%20calls/Services/get_doctors.dart';
import 'package:instant_project/features/calls/specialist%20calls/cubits/Get%20All%20Doctors%20Cubit/get_all_doctors_state.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/doctor_model.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorssState> {
  GetAllDoctorsCubit() : super(GetAllDoctorsInitial());
  void getAllDoctors() async{
  emit(GetAllDoctorsLoading());
  try {
     List<DoctorModel> allDoctors = await displayDoctors();
     log('AllDoctors from cubit: ${allDoctors.toString()}');
     emit(GetAllDoctorsLoaded(doctors: allDoctors));
   } catch (e) {
    print(e);
    emit(GetAllDoctorsErorr());
   }
  }
}
