import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/assets.dart';

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Report Details",
          style: TextStyle(color: AppColors.textColor),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 16),
              width: width * 0.8,
              height: height * 0.05,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(AppAssets.Rectangleimage),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Color(0xFFD8D8D8),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                      child: Image.asset(
                        AppAssets.GroupIcon,
                        width: width * 0.18,
                        height: height * 0.05,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Image.asset(
                        AppAssets.ReportName,
                        width: width * 0.26,
                        height: height * 0.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.LeadingImage),
                  SizedBox(width: width * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.EbrahemImage),
                          SizedBox(width: width * 0.4),
                          Image.asset(AppAssets.ShawkyDate),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Image.asset(AppAssets.SubtitleImage),
                    ],
                  )
                ],
              ),
              SizedBox(height: height * 0.02),
              Image.asset(AppAssets.reportDetails)
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
            child: Row(
              children: [
                Image.asset(AppAssets.ReplayManager),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.LineImage),
              SizedBox(width: width * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.ShawkyImage),
                      SizedBox(width: width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AppAssets.ShawkyName),
                          SizedBox(height: height * 0.01),
                          Image.asset(AppAssets.ShawkySpecialist),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Image.asset(AppAssets.reportDetails),
                  SizedBox(height: height * 0.01),
                  Image.asset(AppAssets.hospitalImage),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, right: 6),
                    child: Image.asset(AppAssets.ShawkyDate),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 16),
              width: width * 0.8,
              height: height * 0.05,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(AppAssets.Rectangle2Image),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Color(0xFFD8D8D8),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Image.asset(
                        AppAssets.ic_fileImage,
                        width: width * 0.26,
                        height: height * 0.03,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Image.asset(
                        AppAssets.ReplayImage,
                        width: width * 0.26,  // 26% من العرض
                        height: height * 0.03,  // 3% من الارتفاع
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 0),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 16),
              width: width * 0.8,  // 80% من العرض
              height: height * 0.05,  // 5% من الارتفاع
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.SendIcon),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Color(0xFFD8D8D8),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}