import 'package:flutter/material.dart';
import 'caseDetails.dart';
import 'package:Project-Instant/core/utils/app_assets.dart';
import 'package:Project-Instant/core/utils/app_colors.dart';

class Case extends StatefulWidget {
  const Case({super.key, required this.title, required this.specialist});
  final String specialist;
  final String title;

  @override
  State<Case> createState() => _CaseState();
}

class _CaseState extends State<Case> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.whiteColor1,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor1,
          title: Text(
            "Cases",
            style:
                TextStyle(fontFamily: 'Poppins', fontSize: screenwidth * 0.055),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          Column(children: [
            Card(
              margin: EdgeInsets.all(screenheight / 60),
              child: Column(
                children: [
                  SizedBox(
                    height: screenheight / 50,
                  ),
                  Row(
                    children: [
                      SizedBox(width: screenwidth / 30),
                      Image.asset(AppAssets.callsProfile),
                      SizedBox(width: screenwidth / 30),
                      Text(
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.032,
                          ),
                          "Ebrahim Khaled")
                    ],
                  ),
                  SizedBox(height: screenheight / 50),
                  Row(children: [
                    SizedBox(width: screenwidth / 30),
                    Image.asset(AppAssets.callCalender),
                    SizedBox(width: screenwidth / 30),
                    Text(
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.032),
                        "24 . 4 . 2021")
                  ]),
                  SizedBox(height: screenheight / 50),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CaseDetails(
                                  title: 'Case Details',
                                  specialist: widget.specialist)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(
                          color: AppColors.greenColor1,
                          width: 2,
                        ),
                        backgroundColor: AppColors.greenColor1,
                        minimumSize:
                            Size(screenwidth * 0.6, screenheight * 0.05),
                      ),
                      child: Text(
                        "Show Details",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.035,
                            color: AppColors.whiteColor1),
                      )),
                  SizedBox(
                    height: screenheight / 60,
                  )
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(screenheight / 60),
              child: Column(
                children: [
                  SizedBox(
                    height: screenheight / 50,
                  ),
                  Row(
                    children: [
                      SizedBox(width: screenwidth / 30),
                      Image.asset(AppAssets.callsProfile),
                      SizedBox(width: screenwidth / 30),
                      Text(
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.032,
                          ),
                          "Ebrahim Khaled")
                    ],
                  ),
                  SizedBox(height: screenheight / 50),
                  Row(children: [
                    SizedBox(width: screenwidth / 30),
                    Image.asset(AppAssets.callCalender),
                    SizedBox(width: screenwidth / 30),
                    Text(
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.032),
                        "24 . 4 . 2021")
                  ]),
                  SizedBox(height: screenheight / 50),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CaseDetails(
                              title: 'Case Details',
                              specialist: widget.specialist,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(
                          color: AppColors.greenColor1,
                          width: 2,
                        ),
                        backgroundColor: AppColors.greenColor1,
                        minimumSize:
                            Size(screenwidth * 0.6, screenheight * 0.05),
                      ),
                      child: Text(
                        "Show Details",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.035,
                            color: AppColors.whiteColor1),
                      )),
                  SizedBox(
                    height: screenheight / 60,
                  )
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(screenheight / 60),
              child: Column(
                children: [
                  SizedBox(
                    height: screenheight / 50,
                  ),
                  Row(
                    children: [
                      SizedBox(width: screenwidth / 30),
                      Image.asset(AppAssets.callsProfile),
                      SizedBox(width: screenwidth / 30),
                      Text(
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.032,
                          ),
                          "Ebrahim Khaled")
                    ],
                  ),
                  SizedBox(height: screenheight / 50),
                  Row(children: [
                    SizedBox(width: screenwidth / 30),
                    Image.asset(AppAssets.callCalender),
                    SizedBox(width: screenwidth / 30),
                    Text(
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.032),
                        "24 . 4 . 2021")
                  ]),
                  SizedBox(height: screenheight / 50),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CaseDetails(
                              title: 'Case Details',
                              specialist: widget.specialist,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(
                          color: AppColors.greenColor1,
                          width: 2,
                        ),
                        backgroundColor: AppColors.greenColor1,
                        minimumSize:
                            Size(screenwidth * 0.6, screenheight * 0.05),
                      ),
                      child: Text(
                        "Show Details",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.035,
                            color: AppColors.whiteColor1),
                      )),
                  SizedBox(
                    height: screenheight / 60,
                  )
                ],
              ),
            ),
          ])
        ]));
  }
}
