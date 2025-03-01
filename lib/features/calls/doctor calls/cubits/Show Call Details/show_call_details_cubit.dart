import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:instant_project/features/calls/doctor%20calls/data/models/call_details_model.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/services/show_call.dart';
import 'package:meta/meta.dart';

part 'show_call_details_state.dart';

class ShowCallDetailsCubit extends Cubit<ShowCallDetailsState> {
  ShowCallDetailsCubit(this.id, this.token) : super(ShowCallDetailsInitial());
  final int id;
  final String token;
   void getCallDetails() async{
  emit(ShowCallDetailsLoading());
  try {
     CallDetailsModel callsDetails = await showCallsDetails(id: id, token: token);
     log('All Details from cubit: ${callsDetails.toString()}');
     emit(ShowCallDetailsLoaded(callDetails: callsDetails));
   } catch (e) {
    print(e);
    emit(ShowCallDetailsError());
   }
  }
}
