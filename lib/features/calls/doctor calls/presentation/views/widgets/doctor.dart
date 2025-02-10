import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/core/components/custom_bar.dart';
import 'package:instant_project/core/components/custom_container_blue.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/views/doctor_calls_view.dart';

class Doctor extends StatelessWidget {
  const Doctor({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:  height/50, horizontal: width/25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height/27,
            ),
            const CustomBar(
              image: AppAssets.doctor,
              name: 'Mahmoud Ahmed',
              speciality: 'Specialist , Doctor',
            ),
            SizedBox(
              height: height/27,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoctorCallsView(),
                  ),
                );
              },
              child: CustomContainerBlue(
                color: AppColors.containerBlue,
                containerBody: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.callContainerIcon,
                      width: width/8,
                      height: height/16,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: height/81,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Calls',
                          style: TextStyles.stylePoppinsRegular14Hint
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          width: width/79,
                        ),
                        Icon(
                          Icons.circle,
                          size: 6.sp,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: height/161,
                    ),
                    Text(
                      'You have new +1 Request',
                      style: TextStyles.stylePoppinsRegular14Hint
                          .copyWith(color: Colors.white, fontSize: 8.sp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
