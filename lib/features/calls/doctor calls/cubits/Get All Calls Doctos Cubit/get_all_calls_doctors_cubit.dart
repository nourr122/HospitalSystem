
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_project/features/calls/doctor%20calls/cubits/Get%20All%20Calls%20Doctos%20Cubit/get_all_calls_doctors_state.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/services/display_all_calls_doctors_service.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/Card_model.dart';

class GetAllCallsDoctorsCubit extends Cubit<GetAllCallsDoctorsState> {
  GetAllCallsDoctorsCubit() : super(GetAllCallsDoctorsInitial());
  void getAllCalls() async{
  emit(GetAllCallsDoctorsLoading());
  try {
     List<CardModel> allCalls = await displayAllCallsDoctors();
     log('AllCalls from cubit: ${allCalls.toString()}');
     emit(GetAllCallsDoctorsLoaded(calls: allCalls));
   } catch (e) {
    print(e);
    emit(GetAllCallsDoctorsErorr());
   }
  }

 
}
