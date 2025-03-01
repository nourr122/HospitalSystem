import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:instant_project/features/calls/specialist%20calls/Services/display_all_calls_service.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/Card_model.dart';
import 'package:meta/meta.dart';

part 'get_all_calls_state.dart';

class GetAllCallsCubit extends Cubit<GetAllCallsState> {
  GetAllCallsCubit() : super(GetAllCallsInitial());
  void getAllCalls() async{
  emit(GetAllCallsLoading());
  try {
     List<CardModel> allCalls = await displayAllCalls();
     log('AllCalls from cubit: ${allCalls.toString()}');
     emit(GetAllCallsLoaded(calls: allCalls));
   } catch (e) {
    print(e);
    emit(GetAllCallsErorr());
   }
  }

 
}
