import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:instant_project/features/calls/nurse%20calls/services/display_all_calls_nurse_service.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/Card_model.dart';
import 'package:meta/meta.dart';

part 'get_all_calls_nurse_state.dart';

class GetAllCallsNurseCubit extends Cubit<GetAllCallsNurseState> {
  GetAllCallsNurseCubit() : super(GetAllCallsNurseInitial());
 void getAllCalls() async{
  emit(GetAllCallsNurseLoading());
  try {
     List<CardModel> allCalls = await displayAllCallsNurse();
     log('AllCalls from cubit: ${allCalls.toString()}');
     emit(GetAllCallsNurseLoaded(calls: allCalls));
   } catch (e) {
    print(e);
    emit(GetAllCallsNurseError());
   }
  }
}
