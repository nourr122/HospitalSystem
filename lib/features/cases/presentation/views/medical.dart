import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';


class Medical extends StatefulWidget {
  const Medical({super.key ,required this.selectedOption});

  final String selectedOption;

  @override
  State<Medical> createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;

  TextEditingController textController = TextEditingController();


  
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor1,
        title: Text(widget.selectedOption,style: TextStyle(fontFamily: 'Poppins', fontSize: screenwidth * 0.055),),
        centerTitle: true,
                leading: IconButton(
          icon: Icon(
            Icons.close, 
            color: AppColors.blackColor1,
          ),
          onPressed: () {
            Navigator.of(context).pop(); 
          },
        ),

      ),
      body:
      ListView(children: [
        Column(
        children: [
          SizedBox(height: screenheight*0.02,),
          widget.selectedOption=="Medical Record"?
         Row(
          children: [
            SizedBox(width: screenwidth*0.02,),
            Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected1 ? AppColors.primaryColor: AppColors.whiteColor1, 
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: AppColors.blackColor1, blurRadius: 2),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Blood Pressure",
                style: TextStyle(
                  color: isSelected1 ? AppColors.whiteColor1 : AppColors.blackColor1,
                  fontSize: screenwidth*0.035,
                  fontFamily: 'poppins',
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isSelected1 = !isSelected1;
                  });
                },
                icon: Icon(
                  isSelected1 ? Icons.close : Icons.add, 
                  color: isSelected1 ? AppColors.whiteColor1: AppColors.blackColor1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: screenwidth*0.02,),
            Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected2 ? AppColors.primaryColor: AppColors.whiteColor1, 
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: AppColors.blackColor1, blurRadius: 2),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sugar analysis",
                style: TextStyle(
                  color: isSelected2 ? AppColors.whiteColor1 : AppColors.blackColor1,
                  fontSize: screenwidth*0.035,
                  fontFamily: 'poppins',
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isSelected2 = !isSelected2;
                  });
                },
                icon: Icon(
                  isSelected2 ? Icons.close : Icons.add, 
                  color: isSelected2 ? AppColors.whiteColor1 : AppColors.blackColor1,
                ),
              ),
            ],
          ),
        ),


         ],):Row(
          children: [
            SizedBox(width: screenwidth*0.02,),
            Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected1 ? AppColors.primaryColor : AppColors.whiteColor1, 
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: AppColors.blackColor1, blurRadius: 2),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "SGOT,SGPT",
                style: TextStyle(
                  color: isSelected1 ? AppColors.whiteColor1 : AppColors.blackColor1,
                  fontSize: screenwidth*0.032,
                  fontFamily: 'poppins',
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isSelected1 = !isSelected1;
                  });
                },
                icon: Icon(
                  isSelected1 ? Icons.close : Icons.add, 
                  color: isSelected1 ? AppColors.whiteColor1 : AppColors.blackColor1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: screenwidth*0.01,),
            Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected2 ? AppColors.primaryColor : AppColors.whiteColor1, 
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: AppColors.blackColor1, blurRadius: 2),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "ESR",
                style: TextStyle(
                  color: isSelected2 ? AppColors.whiteColor1: AppColors.blackColor1,
                  fontSize: screenwidth*0.032,
                  fontFamily: 'poppins',
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isSelected2 = !isSelected2;
                  });
                },
                icon: Icon(
                  isSelected2 ? Icons.close : Icons.add, 
                  color: isSelected2 ? AppColors.whiteColor1 : AppColors.blackColor1,
                ),
              ),
            ],
          ),
        ),
                SizedBox(width: screenwidth*0.01,),

                    Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected3 ? AppColors.primaryColor : AppColors.whiteColor1, 
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: AppColors.blackColor1, blurRadius: 2),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Liquid Profile",
                style: TextStyle(
                  color: isSelected3 ? AppColors.whiteColor1 : AppColors.blackColor1,
                  fontSize: screenwidth*0.032,
                  fontFamily: 'poppins',
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isSelected3 = !isSelected3;
                  });
                },
                icon: Icon(
                  isSelected3 ? Icons.close : Icons.add, 
                  color: isSelected3 ? AppColors.whiteColor1 : AppColors.blackColor1,
                ),
              ),
            ],
          ),
        ),


         ],),
                     SizedBox(height: screenheight*0.02,),
        Row(
          children: [
            SizedBox(width: screenwidth*0.02,),
            Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected4 ? AppColors.primaryColor : AppColors.whiteColor1, 
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: AppColors.blackColor1, blurRadius: 2),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Measurement",
                style: TextStyle(
                  color: isSelected4 ? AppColors.whiteColor1: AppColors.blackColor1,
                  fontSize: screenwidth*0.035,
                  fontFamily: 'poppins',
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isSelected4 = !isSelected4;
                  });
                },
                icon: Icon(
                  isSelected4 ? Icons.close : Icons.add, 
                  color: isSelected4 ? AppColors.whiteColor1: AppColors.blackColor1,
                ),
              ),
            ],
          ),
        ),
          ],),
          SizedBox(height: screenheight*0.03,),
          Padding(
          padding: EdgeInsets.all(screenwidth*0.02),
            child: 
                  TextField(
                    controller: textController,
                    cursorColor: AppColors.grayColor3,
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColor1,
                      filled: true,
                      labelText: "Add Note",
                      labelStyle: TextStyle(fontSize: screenwidth*0.035,fontFamily: 'poppins',),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(width: screenwidth*0.001,color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder( 
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                width: screenwidth * 0.001,
                color: AppColors.grayColor3,
              ),
            ),

                      contentPadding: EdgeInsets.symmetric(vertical: screenheight*0.05, horizontal: screenwidth*0.04), 
                    ),
                  ),
                )  ,
                SizedBox(height: screenheight*0.45,),
                Row(
                  children: [
                    SizedBox(width: screenwidth*0.02,),
                  OutlinedButton(
              onPressed: () {
              Navigator.of(context).pop(); 
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(color: AppColors.primaryColor, width: 2),
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(screenwidth*0.96, screenheight * 0.06),
              ),
              child: Text(
                "Send",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: screenwidth * 0.035,
                  color: AppColors.whiteColor1,
                ),
              ),
            ),    SizedBox(width: screenwidth*0.02,),
                ],)
            ]
      ),
      ],)
      
      );
      }
      }


