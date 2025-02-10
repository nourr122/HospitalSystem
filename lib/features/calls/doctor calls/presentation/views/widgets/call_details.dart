import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/core/components/custom_calls_buttons.dart';

class CallDetails extends StatelessWidget {
  const CallDetails({
    super.key,
    required this.titleName,
    required this.subtitle,
    required this.body,
  });

  final String titleName;
  final String subtitle;
  final Widget body;

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/25, vertical: height/50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AppAssets.human,
                  height: height/16,
                  width: width/8,
                  fit: BoxFit.cover,
                ),
                
                SizedBox(width: width/39),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              titleName,
                              style: TextStyles.stylePoppinsMedium14Title,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '13 Mar 2020',
                            style: TextStyles.stylePoppinsRegular12Subtitle,
                          ),
                        ],
                      ),

                      
                      Text(
                        subtitle,
                        style: TextStyles.stylePoppinsRegular12Subtitle
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height/67),
            body,
            SizedBox(height: height/50),
            const CustomCallsButtons(),
          ],
        ),
      ),
    );
  }
}


