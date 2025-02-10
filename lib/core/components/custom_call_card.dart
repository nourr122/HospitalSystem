import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/text_styles.dart';

class CustomCallCard extends StatelessWidget {
  const CustomCallCard(
      {super.key, required this.doctorName, required this.callTime, this.doc, this.icon, this.onTap, this.buttons});

  final String doctorName;
  final String callTime;
  final Widget? doc; 
  final Widget? icon;
  final Widget? buttons;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width / 25, vertical: height / 101),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          elevation: 15,
          shadowColor: Colors.grey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 25, vertical: height / 101),
            child: Column(
              children: [
                SizedBox(
                  height: height / 54,
                ),
                Row(
                  children: [
                    SizedBox(
                        height: height / 40,
                        width: width / 20,
                        child: Image.asset(
                          AppAssets.callsProfile,
                          fit: BoxFit.cover,
                        ),),
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      doctorName,
                      style: TextStyles.stylePoppinsMedium14Title,
                    ),
                    const Spacer(),
                    if (icon != null) icon!
                  ],
                ),
                SizedBox(
                  height: height / 67,
                ),
                if (doc!= null) doc!,
                Row(
                  children: [
                    SizedBox(
                        height: height / 40,
                        width: width / 20,
                        child: Image.asset(
                          AppAssets.callCalender,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      callTime,
                      style: TextStyles.stylePoppinsMedium14Title,
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                if (buttons != null) buttons!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
