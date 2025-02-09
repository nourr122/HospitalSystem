import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
  });
  final String image;
  final String name;
  final String speciality;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: height/16,
          width: width/8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(height/15)),
          child: GestureDetector(
            onTap:() {
              
            } ,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: width/79,
        ),
        Column(
          children: [
            Text(
              name, 
              style: TextStyles.stylePoppinsMedium14Title,),
            Text(
              speciality,
              style: TextStyles.stylePoppinsRegular12Subtitle.copyWith(color: AppColors.primaryColor),
              ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            
          },
          child: SizedBox(
            height: height/32,
            width: width/16,
            child: Image.asset(
              AppAssets.notification,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
