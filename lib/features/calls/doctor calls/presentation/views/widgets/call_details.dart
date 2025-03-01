import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/core/components/custom_calls_buttons.dart';
import 'package:instant_project/features/calls/constants.dart';
import 'package:instant_project/features/calls/doctor%20calls/cubits/Show%20Call%20Details/show_call_details_cubit.dart';

class CallDetails extends StatelessWidget {
  const CallDetails({
    super.key,
    //required this.body,
    //required this.id,
  });

  //final Widget body;
  //final int id;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Call Details',
          style: TextStyles.stylePoppinsRegular16PageTitle,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ShowCallDetailsCubit, ShowCallDetailsState>(
        builder: (context, state) {
         if(state is ShowCallDetailsLoading){
          return const Center(child: CircularProgressIndicator(),);
         }else if (state is ShowCallDetailsLoaded){
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 25, vertical: height / 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.human,
                      height: height / 16,
                      width: width / 8,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: width / 39),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  state.callDetails.doctorId,
                                  style: TextStyles.stylePoppinsMedium14Title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                state.callDetails.createdAt,
                                style: TextStyles.stylePoppinsRegular12Subtitle,
                              ),
                            ],
                          ),
                          Text(
                            'Specialist - Manager',
                            style: TextStyles.stylePoppinsRegular12Subtitle
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 67),
                //body,
                Text(
                            state.callDetails.description,
                            style: TextStyles.stylePoppinsMedium14Title
                                .copyWith(color: AppColors.black),
                          ),
                SizedBox(height: height / 50),
                 CustomCallsButtons(
                  id: state.callDetails.id,
                  token: doctorToken,
                  ),
              ],
            ),
          );
          }else if(state is ShowCallDetailsError){
            return Text(state.errorMessage);
          }else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
