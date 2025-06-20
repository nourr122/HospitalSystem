import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/core/components/custom_button.dart';
import 'package:instant_project/features/home/presentation/views/homeDynamicScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Success extends StatelessWidget {
  const Success({super.key});
  Future<int?> getID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userID');
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: height / 50, horizontal: width / 25),
        child: Column(
          children: [
            const Spacer(),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 4,
                  width: width / 2,
                  child: Image.asset(
                    AppAssets.success,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'The request has been canceled successfully',
                  style: TextStyles.stylePoppinsMedium16SuccessBody
                      .copyWith(fontSize: 20.sp),
                  textAlign: TextAlign.center,
                )
              ],
            )),
            const Spacer(),
            CustomButton(
              onPressed: () async {
                int? id = await getID();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDynamicScreen(
                      id: id!,
                    ),
                  ),
                );
              },
              buttonBody: Text('Back To Home',
                  style: TextStyles.stylePoppinsRegular14Hint
                      .copyWith(color: Colors.white, fontSize: 16.sp)),
              width: double.infinity,
              color: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
