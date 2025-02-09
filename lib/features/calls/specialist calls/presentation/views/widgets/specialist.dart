import 'package:flutter/material.dart';
import 'package:instant_project/core/components/custom_bar.dart';
import 'package:instant_project/core/components/custom_container_blue.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/specialist_calls_view.dart';

class Specialist extends StatelessWidget {
  const Specialist({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height / 50, horizontal: width / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 27,
            ),
            const CustomBar(
              image: AppAssets.specialist,
              name: 'Ebrahem El Zainy',
              speciality: 'Specialist , Receptionist',
            ),
            SizedBox(
              height: height / 27,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SpecialistCallsView()));
              },
              child: CustomContainerBlue(
                color: AppColors.containerBlue,
                containerBody: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.callContainerIcon,
                      width: width / 8,
                      height: height / 16,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: height / 81,
                    ),
                    Text(
                      'Calls',
                      style: TextStyles.stylePoppinsRegular14Hint
                          .copyWith(color: Colors.white),
                    )
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
