import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_project/core/components/custom_call_card.dart';
import 'package:instant_project/features/calls/constants.dart';
import 'package:instant_project/features/calls/doctor%20calls/cubits/Get%20All%20Calls%20Doctos%20Cubit/get_all_calls_doctors_cubit.dart';
import 'package:instant_project/features/calls/doctor%20calls/cubits/Get%20All%20Calls%20Doctos%20Cubit/get_all_calls_doctors_state.dart';
import 'package:instant_project/core/components/custom_calls_buttons.dart';
import 'package:instant_project/features/calls/doctor%20calls/cubits/Show%20Call%20Details/show_call_details_cubit.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/views/widgets/call_details.dart';
import 'package:instant_project/features/calls/specialist%20calls/cubits/Get%20All%20Calls%20Cubit/get_all_calls_cubit.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/Card_model.dart';

class CustomDoctorCardListView extends StatelessWidget {
  const CustomDoctorCardListView({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<GetAllCallsDoctorsCubit, GetAllCallsDoctorsState>(
      builder: (context, state) {
        if (state is GetAllCallsDoctorsLoading){
          return const Center(child: CircularProgressIndicator(),); 
        }else if (state is GetAllCallsDoctorsLoaded){
            List<CardModel> calls = state.calls;
        return Expanded(
          child: ListView.builder(
            itemCount: calls.length,
            itemBuilder: (context, index) {
              return CustomCallCard(
                name: calls[index].patientName,
                callTime: calls[index].createdAt,
                buttons: Column(
                  children: [
                    SizedBox(
                      height: height / 40,
                    ),
                    CustomCallsButtons(id: calls[index].id, token: doctorToken,),
                    SizedBox(
                      height: height / 54,
                    )
                  ],
                ),
                onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>
            BlocProvider<ShowCallDetailsCubit>(
              create: (BuildContext context) => ShowCallDetailsCubit(calls[index].id, token)..getCallDetails(),
              child: const CallDetails(),
            )));
                },
          ); } ),);
        }else if(state is GetAllCallsDoctorsErorr){
          return Text(state.errorMessage);
        }else{
          return const SizedBox();
        }
      },
    );
  }
}
