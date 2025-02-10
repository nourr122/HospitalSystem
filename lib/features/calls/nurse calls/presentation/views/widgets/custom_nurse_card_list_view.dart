import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instant_project/core/components/custom_call_card.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/views/widgets/call_details.dart';
import 'package:instant_project/core/components/custom_calls_buttons.dart';

class CustomNurseCardListView extends StatelessWidget {
  const CustomNurseCardListView({super.key, required this.doctorName});
  final String doctorName;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return CustomCallCard(
            doctorName: 'Ebrahem Khaled', 
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
                        ),),
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
            callTime: '24.04.2021',
            buttons: Column(
              children: [
                const CustomCallsButtons(),
                SizedBox(
                  height: height / 54,
                )
              ],
            ),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CallDetails(
                titleName: 'Shawky Ahmed',
                subtitle: 'Specialist - Manager',
                body: Text(
                  'Details note : Lorem Ipsum is simply dummy text of printing and typesetting industry.Lorem Ipsum',
                  style: TextStyles.stylePoppinsMedium14Title,
                ),
              ),
            ),
          );
            },
            
            );
        },
      ),
    );
  }
}
