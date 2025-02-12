import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/app_assets.dart';


class AddMedical extends StatefulWidget {
  const AddMedical({super.key,required this.role });
  final String role;

  @override
  State<AddMedical> createState() => _AddMedicalState();
}

class _AddMedicalState extends State<AddMedical> {
    TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();


  List<String> items1 = ['Blood pressure', 'Sugar analysis', 'Sugar analysis', 'Sugar analysis'];
  List<String> items2 = ['Sugar analysis', 'Blood pressure', 'Blood pressure', 'Blood pressure'];

  String? selectedItem1 = 'Blood pressure';
  String? selectedItem2 = 'Sugar analysis';

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor1,
        title:widget.role=="Nurse"?
              const Text("Add Measurement")
              :widget.role=="Analysis Employee"?
              const Text("Add Medical record")
              :Container(),
          centerTitle: true,
      ),
      body:
      Padding(padding: EdgeInsets.all(screenwidth*0.02), 
        child: ListView(
                  children: [
                    Column(
                      children: [
         ListTile(
                      trailing: Text(
         "15 Mar 2021",
         style: TextStyle(
           fontFamily: 'poppins',
           fontSize: screenwidth * 0.03,
           color: AppColors.grayColor3,
         ),
         softWrap: true,
         overflow: TextOverflow.visible,
                      ),
                      leading: ClipRRect(
         borderRadius: BorderRadius.circular(12),
         child: Image.asset(AppAssets.Aml),
                      ),
                      title: Text(
         "Aml Ezzat",
         style: TextStyle(
           fontFamily: 'poppins',
           color: AppColors.blackColor1,
           fontSize: screenwidth * 0.04,
         ),
                      ),
                      subtitle: Text(
         "Specialist - Analysis employee",
         style: TextStyle(
           fontFamily: 'poppins',
           color: AppColors.primaryColor,
           fontSize: screenwidth * 0.03,
         ),
                      ),
                    ),
                    SizedBox(height: screenheight * 0.01),
                    Text(
                      "Details Note: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
                      style: TextStyle(
         fontFamily: 'poppins',
         fontSize: screenwidth * 0.04,
         color: AppColors.blackColor1,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(height: screenheight*0.02,),

                    widget.role=="Nurse"?
                 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
         OutlinedButton(
           onPressed: () {},
           style: ElevatedButton.styleFrom(
             padding: EdgeInsets.symmetric(vertical: screenheight*0.02,horizontal: screenwidth*0.02),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12),
             ),
             side: const BorderSide(
               color: AppColors.primaryColor,
               width: 1,
             ),
             backgroundColor: AppColors.primaryColor,
           ),
           child: Text(
             "Blood Pressure",
             style: TextStyle(
               fontFamily: 'poppins',
               fontSize: screenwidth * 0.04,
               color: AppColors.whiteColor1
             ),
           ),
         ),
         SizedBox(width: screenwidth*0.02,),
         OutlinedButton(
           onPressed: () {},
           style: ElevatedButton.styleFrom(
             padding: EdgeInsets.symmetric(vertical: screenheight*0.02,horizontal: screenwidth*0.02),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12),
             ),
             side: const BorderSide(
               color: AppColors.primaryColor,
               width: 1,
             ),
             backgroundColor: AppColors.primaryColor
           ),
           child: Text(
             "Sugar analysis",
             style: TextStyle(
               fontFamily: 'poppins',
               fontSize: screenwidth * 0.04,
               color: AppColors.whiteColor1,
             ),
           ),
         ),
                      ],

                    ):widget.role=="Analysis Employee"?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
         OutlinedButton(
           onPressed: () {},
           style: ElevatedButton.styleFrom(
             padding: EdgeInsets.symmetric(vertical: screenheight*0.02,horizontal: screenwidth*0.02),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12),
             ),
             side: const BorderSide(
               color: AppColors.primaryColor,
               width: 1,
             ),
             backgroundColor: AppColors.primaryColor,
           ),
           child: Text(
             "SGOT-SGPT",
             style: TextStyle(
               fontFamily: 'poppins',
               fontSize: screenwidth * 0.04,
               color: AppColors.whiteColor1,
             ),
           ),
         ),
         SizedBox(width: screenwidth*0.02,),
         OutlinedButton(
           onPressed: () {},
           style: ElevatedButton.styleFrom(
             padding: EdgeInsets.symmetric(vertical: screenheight*0.02,horizontal: screenwidth*0.02),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12),
             ),
             side: const BorderSide(
               color: AppColors.primaryColor,
               width: 1,
             ),
             backgroundColor: AppColors.primaryColor,
           ),
           child: Text(
             "ESR",
             style: TextStyle(
               fontFamily: 'poppins',
               fontSize: screenwidth * 0.04,
               color: AppColors.whiteColor1,
             ),
           ),
         ),
         SizedBox(width: screenwidth*0.02,),
         OutlinedButton(
           onPressed: () {},
           style: ElevatedButton.styleFrom(
             padding: EdgeInsets.symmetric(vertical: screenheight*0.02,horizontal: screenwidth*0.02),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12),
             ),
             side: const BorderSide(
               color: AppColors.primaryColor,
               width: 1,
             ),
             backgroundColor: AppColors.primaryColor,
           ),
           child: Text(
             "Liquid profile",
             style: TextStyle(
               fontFamily: 'poppins',
               fontSize: screenwidth * 0.04,
               color: AppColors.whiteColor1
             ),
           ),
         ),
                      ],
                    ):Container(),
                     SizedBox(height: screenheight * 0.02),
                    Row(
                      children: [
         widget.role=="Nurse"?
         Text(
           "Add Measurement",
           style: TextStyle(
             fontFamily: 'poppins',
             fontSize: screenwidth * 0.04,
             color: AppColors.blackColor1,
           ),
         ):widget.role=="Analysis Employee"?
          Text(
           "Add Record",
           style: TextStyle(
             fontFamily: 'poppins',
             fontSize: screenwidth * 0.04,
             color: AppColors.blackColor1,
           ),
         ):Container()
                      ],
                    ),
                    SizedBox(height: screenheight * 0.01),

                    widget.role=="Nurse"?
                    Column(children: [
         Row(
                      children: [
         Expanded(child:Card(
             child: Padding(
               padding: EdgeInsets.all(screenwidth * 0.02),
               child: DropdownButton<String>(
                 underline: const SizedBox.shrink(),
                 icon: Icon(
                   Icons.arrow_drop_down,
                   color: AppColors.blackColor1,
                   size: screenwidth*0.08,
                 ),
                 style: TextStyle(
                 fontFamily: 'Poppins',
                 fontSize: screenwidth * 0.035,
                 color: AppColors.blackColor1,
               ),
                 value: selectedItem1,
                 items: items1.map((String item) {
                   return DropdownMenuItem<String>(
                     value: item,
                     child: Text(item),
                   );
                 }).toList(),
                 onChanged: (String? newValue) {
                   setState(() {
                     selectedItem1 = newValue;
                   });
                 },
               ),
             ),
           ),
          ),

                      SizedBox(width: screenwidth*0.02,),
                      Expanded(child:
                      TextField(
             controller: textController1,
             cursorColor: AppColors.grayColor3,
             decoration: InputDecoration(
               fillColor: AppColors.whiteColor1,
               filled: true,
               labelText: "Add value",
               labelStyle: TextStyle(
                 fontSize: screenwidth * 0.035,
                 fontFamily: 'poppins',
               ),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(width: screenwidth * 0.001, color: Colors.transparent),
               ),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(
                   width: screenwidth * 0.001,
                   color:AppColors.grayColor3
                 ),
               ),
               contentPadding: EdgeInsets.symmetric(vertical: screenheight * 0.025, horizontal: screenwidth * 0.03),
             ),
           ),)


                      ],
                    ),
                    SizedBox(height: screenheight * 0.02),
                    Row(
                      children: [
         Expanded(child:Card(
             child: Padding(
               padding: EdgeInsets.all(screenwidth * 0.03),
               child: DropdownButton<String>(
                 underline: const SizedBox.shrink(),
                 icon: Icon(
                   Icons.arrow_drop_down,
                   color: AppColors.blackColor1,
                   size: screenwidth*0.08,
                 ),
                 style: TextStyle(
                 fontFamily: 'Poppins',
                 fontSize: screenwidth * 0.035,
                 color: AppColors.blackColor1,
               ),
                 value: selectedItem2,
                 items: items2.map((String item) {
                   return DropdownMenuItem<String>(
                     value: item,
                     child: Text(item),
                   );
                 }).toList(),
                 onChanged: (String? newValue) {
                   setState(() {
                     selectedItem2 = newValue;
                   });
                 },
               ),
             ),
           ), ),


         SizedBox(width: screenwidth*0.02,),

             Expanded(child:
             TextField(
             controller: textController2,
             cursorColor: AppColors.grayColor3,
             decoration: InputDecoration(
               fillColor: AppColors.whiteColor1,
               filled: true,
               labelText: "Add value",
               labelStyle: TextStyle(
                 fontSize: screenwidth * 0.035,
                 fontFamily: 'poppins',
               ),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(width: screenwidth * 0.001, color: Colors.transparent),
               ),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(
                   width: screenwidth * 0.001,
                   color: AppColors.grayColor3
                 ),
               ),
               contentPadding: EdgeInsets.symmetric(vertical: screenheight * 0.025, horizontal: screenwidth * 0.03),
             ),
           ),
         )

                      ],
                    ),
                    SizedBox(height: screenheight*0.02,),
                    Row(children: [
                      Expanded(child: TextField(
             controller: textController3,
             cursorColor: AppColors.grayColor3,
             decoration: InputDecoration(
               fillColor: AppColors.whiteColor1,
               filled: true,
               labelText: "Add Note",
               labelStyle: TextStyle(
                 fontSize: screenwidth * 0.035,
                 fontFamily: 'poppins',
               ),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(width: screenwidth * 0.001, color: Colors.transparent),
               ),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(
                   width: screenwidth * 0.001,
                   color: AppColors.grayColor3
                 ),
               ),
               contentPadding: EdgeInsets.symmetric(vertical: screenheight * 0.038, horizontal: screenwidth * 0.03),
             ),
           ))
                    ],)


                    ],)
                    :widget.role=="Analysis Employee"?
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
           onPressed: () {},
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
                    )):Container(),

                    widget.role=="Nurse"?
                    Column(
                      children: [
         SizedBox(height: screenheight*0.165,),
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
         minimumSize: Size(screenwidth*0.96, screenheight * 0.055),
                      ),
                      child: Text(
         "Add Measurement",
         style: TextStyle(
           fontFamily: 'Poppins',
           fontSize: screenwidth * 0.035,
           color: AppColors.whiteColor1,
         ),
                      ),
                    ),
                      ],
                    ):widget.role=="Analysis Employee"?
                    Column(
                      children: [SizedBox(height:screenheight*0.24),
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
         minimumSize: Size(screenwidth*0.96, screenheight * 0.055),
                      ),
                      child: Text(
         "Add Record",
         style: TextStyle(
           fontFamily: 'Poppins',
           fontSize: screenwidth * 0.035,
           color: AppColors.whiteColor1,
         ),
                      ),
                    ),  ],
                    ):const SizedBox()
                      ]
                    )
                  ],
                )

        )
      );
      }
      }
