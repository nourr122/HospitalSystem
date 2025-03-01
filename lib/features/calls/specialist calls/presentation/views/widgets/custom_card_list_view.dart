// import 'package:flutter/material.dart';
// import 'package:instant_project/core/components/custom_call_card.dart';
// import 'package:instant_project/core/utils/app_assets.dart';

// class CustomCardListView extends StatelessWidget {
//    CustomCardListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: model.length,
//         itemBuilder:(context, index) {
//           return CustomCallCard(
//             doctorName: model[index].nameTitle,
//             icon: Image.asset(model[index].icon),
//             callTime: model[index].callTime,
//             );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:instant_project/core/components/custom_call_card.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_project/features/calls/specialist%20calls/cubits/Get%20All%20Calls%20Cubit/get_all_calls_cubit.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/Card_model.dart';




class CustomCardListView extends StatelessWidget {
  CustomCardListView({super.key});

  @override
  Widget build(BuildContext context) {
        context.read<GetAllCallsCubit>().getAllCalls();

    return BlocBuilder<GetAllCallsCubit, GetAllCallsState>(
      builder: (context, state) {
        if(state is GetAllCallsLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else if(state is GetAllCallsLoaded)
          {
            List<CardModel> calls = state.calls;
            return Expanded(
              child: ListView.builder(
                itemCount: calls.length,
                itemBuilder: (context, index) {
                  return CustomCallCard(
                name: calls[index].patientName,
                icon: Image.asset((calls[index].status == 'logout' ? AppAssets.greenChecked : AppAssets.callstime)),
                callTime: calls[index].createdAt,
                onTap: () {
                  
                },
              );
            },
          ),
        );
        }else if(state is GetAllCallsErorr){
          return Center(child: Text(state.errorMessage));
        }
      else {return const SizedBox();}

      },
    );
  }
}
