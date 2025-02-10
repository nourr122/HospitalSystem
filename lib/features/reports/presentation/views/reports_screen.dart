import 'package:flutter/material.dart';
import 'create_report.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/assets.dart';
import 'report_details_screen.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  List<bool> _isPressed = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Reports",
          style: TextStyle(
            color: Color(0xFF343434),
            fontSize: 20,
            fontFamily: 'Poppins',
            letterSpacing: 0,
            height: 21,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.02, right: screenWidth * 0.1),
              width: screenWidth * 0.7972,
              height: screenHeight * 0.055,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(AppAssets.rectangleImage),
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
                    top: 0,
                    left: screenWidth * 0.69,
                    child: Image.asset(
                      AppAssets.iconImage,
                      width: screenWidth * 0.12,
                      height: screenHeight * 0.055,
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.01,
                    left: screenWidth * 0.05,
                    child: Image.asset(
                      AppAssets.dateImage,
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.03,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: screenHeight * 0.03),
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPressed[index] = !_isPressed[index];
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReportDetailsScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: _isPressed[index]
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppAssets.reportIcon,
                                  width: screenWidth * 0.08,
                                  height: screenHeight * 0.04,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Row(
                                  children: [
                                    SizedBox(width: screenWidth * 0.02),
                                    Image.asset(
                                      AppAssets.dateIcon,
                                      width: screenWidth * 0.0533,
                                      height: screenHeight * 0.0313,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.04),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Report Name",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  "24 . 04 . 2021",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.green.withOpacity(0.2)
                                : Colors.orange.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            index % 2 == 0 ? "Finished" : "Process",
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: index % 2 == 0 ? Colors.green : Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.143,
            right: -7,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateReport()),
                );
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Image.asset(
                AppAssets.backgroundIcon,
                width: screenWidth * 0.12,
                height: screenHeight * 0.055,
              ),
            ),
          ),
        ],
      ),
    );
  }
}