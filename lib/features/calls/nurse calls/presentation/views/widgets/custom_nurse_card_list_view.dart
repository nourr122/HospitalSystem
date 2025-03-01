import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instant_project/core/components/custom_call_card.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/constants.dart';
import 'package:instant_project/features/calls/doctor%20calls/cubits/Show%20Call%20Details/show_call_details_cubit.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/views/widgets/call_details.dart';
import 'package:instant_project/core/components/custom_calls_buttons.dart';
import 'package:instant_project/features/calls/nurse%20calls/cubits/Get%20All%20Calls%20Nurse/get_all_calls_nurse_cubit.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/Card_model.dart';

class CustomNurseCardListView extends StatelessWidget {
  const CustomNurseCardListView({super.key, required this.doctorName, required this.token});
  final String doctorName;
  final String token; 
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocBuilder<GetAllCallsNurseCubit, GetAllCallsNurseState>(
      builder: (context, state) {
        if (state is GetAllCallsNurseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAllCallsNurseLoaded) {
          List<CardModel> calls = state.calls;
          return Expanded(
            child: ListView.builder(
              itemCount: calls.length,
              itemBuilder: (context, index) {
                return CustomCallCard(
                  name: calls[index].patientName,
                  doc: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: height / 40,
                            width: width / 20,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(2)),
                            child: Icon(
                              FontAwesomeIcons.stethoscope,
                              color: Colors.white,
                              size: 12.sp,
                            ),
                          ),
                          SizedBox(
                            width: width / 20,
                          ),
                          Text(
                            doctorName,
                            style: TextStyles.stylePoppinsMedium14Title,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 67,
                      ),
                    ],
                  ),
                  callTime: calls[index].createdAt,
                  buttons: Column(
                    children: [
                      CustomCallsButtons(
                        id: calls[index].id,
                        token: nurseToken,
                      ),
                      SizedBox(
                        height: height / 54,
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => ShowCallDetailsCubit(calls[index].id, token)..getCallDetails(),
                          child:  const CallDetails(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else if (state is GetAllCallsNurseError) {
          return Text(state.errorMessage);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
