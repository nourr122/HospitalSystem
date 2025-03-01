import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:dotted_border/dotted_border.dart';



class CreateReport extends StatefulWidget {
  const CreateReport({super.key});


  @override
  State<CreateReport> createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  TextEditingController textController1 = TextEditingController();
    TextEditingController textController2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor1,
        title: const Text(
          'Create Report',
          style: TextStyle(color: AppColors.grayColor2),
        ),
        centerTitle: true,
      ),
      body: 
        Padding(padding: EdgeInsets.all(screenwidth*0.03),
        child: ListView(
          children: [
            TextField(
                    controller: textController1,
                    cursorColor: AppColors.grayColor3,
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColor1,
                      filled: true,
                      hintText: "Report Name",
                      hintStyle: TextStyle(fontSize: screenwidth*0.035,fontFamily: 'poppins',color: AppColors.grayColor2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(width: screenwidth*0.001,color: AppColors.grayColor3),
                      ),
                      focusedBorder: OutlineInputBorder( 
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                width: screenwidth * 0.001,
                color: AppColors.grayColor3,
              ),
            ),
                      contentPadding: EdgeInsets.symmetric(vertical: screenheight*0.02, horizontal: screenwidth*0.02), 
                    ),
                  ),
                  SizedBox(height:screenwidth*0.03),
                  TextField(
                    controller: textController2,
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColor1,
                      filled: true,
                      hintText: "Description",
                      hintStyle: TextStyle(fontSize: screenwidth*0.035,fontFamily: 'poppins',color: AppColors.grayColor2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(width: screenwidth*0.001,color: AppColors.grayColor3),
                      ),
                      focusedBorder: OutlineInputBorder( 
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                width: screenwidth * 0.001,
                color: AppColors.grayColor3,
              ),
            ),
                      contentPadding: EdgeInsets.symmetric(vertical: screenheight*0.06, horizontal: screenwidth*0.02), 
                    ),
                  ),
                  SizedBox(height:screenheight*0.03),
                              DottedBorder(
              dashPattern: const [13,14],
              color: AppColors.grayColor3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children:[
                SizedBox(height:screenheight*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(AppAssets.uploadImage),],
                  ),
                SizedBox(height:screenheight*0.02),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  OutlinedButton(
                  onPressed: () {
                     
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: screenheight*0.015,horizontal: screenwidth*0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: const BorderSide(
                      color: AppColors.primaryColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add,color: AppColors.primaryColor,),Text(
                    "Upload Image",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: screenwidth * 0.04,
                      color: AppColors.primaryColor,
                    ),
                  ),],),
                ),
                ],),
                SizedBox(height:screenheight*0.02),
                                 
              ]
            )),
            SizedBox(height: screenheight*0.28,),
            OutlinedButton(
              onPressed: () {
              Navigator.of(context).pop(); 
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: const BorderSide(color: AppColors.primaryColor, width: 2),
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(screenwidth*0.96, screenheight * 0.065),
              ),
              child: Text(
                "Create Report",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: screenwidth * 0.035,
                  color: AppColors.whiteColor1,
                ),
              ),
            ),  



          ],
        )
        ,)
    );
  }
}
