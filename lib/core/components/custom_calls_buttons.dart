import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/core/components/custom_button.dart';

class CustomCallsButtons extends StatelessWidget {
  const CustomCallsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          buttonBody: Row(
            children: [
               Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 20.sp,
              ),
              SizedBox(
                width: width / 79,
              ),
              Text('Accept',
                  style: TextStyles.stylePoppinsRegular14Hint
                      .copyWith(color: Colors.white, fontSize: 11.sp))
            ],
          ),
          width: width / 2.9,
          color: AppColors.color1,
          onPressed: () {},
        ),
        SizedBox(
          width: width / 26,
        ),
        CustomButton(
          buttonBody: Row(
            children: [
               Icon(
                Icons.cancel_outlined,
                color: Colors.white,
                size: 20.sp,
              ),
              SizedBox(
                width: width / 79,
              ),
              Text('Busy',
                  style: TextStyles.stylePoppinsRegular14Hint
                      .copyWith(color: Colors.white, fontSize: 11.sp ))
            ],
          ),
          width: width / 2.9,
          color: AppColors.color2,
          onPressed: () {},
        )
      ],
    );
  }
}
