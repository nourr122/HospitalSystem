import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/cases/data/models/datamodel.dart';

class SelectNurse extends StatefulWidget {
  const SelectNurse({super.key});

  @override
  _SelectNurseState createState() => _SelectNurseState();
}

class _SelectNurseState extends State<SelectNurse> {
  String? selectedNurse;
  TextEditingController searchController = TextEditingController();
  List<NurseModel> nurse= [];
  List<NurseModel> filteredNurse=[];

  @override
  void initState() {
    super.initState();
    nurse = [
      NurseModel(
          name: 'Dr. Salma Ahmed',
          specialty: 'Specialist - Nurse',
          image: AppAssets.nurse1,
          isOnline: true),
      NurseModel(
          name: 'Dr. Helmy Fadl',
          specialty: 'Specialist - Nurse',
          image: AppAssets.nurse2,
          isOnline: true),
      NurseModel(
          name: 'Dr. Alaa Haleem',
          specialty: 'Specialist - Nurse',
          image: AppAssets.nurse3,
          isOnline: true),
      NurseModel(
          name: 'Dr. Hend Mahmoud',
          specialty: 'Specialist - Nurse',
          image: AppAssets.nurse4,
          isOnline: true),
      NurseModel(
          name: 'Dr. Samar Ahmed',
          specialty: 'Specialist - Nurse',
          image: AppAssets.nurse5,
          isOnline: false),
      NurseModel(
          name: 'Dr. Hesham Ali',
          specialty: 'Specialist - Nurse',
          image: AppAssets.nurse6,
          isOnline: false),
    ];
    filteredNurse = nurse;
  }

  void _filterNurse(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredNurse = nurse;
      } else {
        filteredNurse = nurse
            .where((nurse) =>
                nurse.name.toLowerCase().contains(query.toLowerCase()) ||
                nurse.specialty.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Select Nurse",
          style:TextStyle(fontFamily: 'Poppins', fontSize: screenwidth * 0.055),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenheight *0.02),
            child: TextField(
              controller: searchController,
              onChanged: _filterNurse,
              decoration: InputDecoration(
                hintText: "Search for nurse",
                hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: screenwidth * 0.04),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNurse.length,
              itemBuilder: (context, index) {
                NurseModel nurse = filteredNurse[index];

                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: screenwidth*0.02,
                      vertical: screenheight*0.002 ), 
                  title: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: screenheight / 12,
                            width: screenwidth / 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(screenheight / 67),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(screenheight / 67),
                              child:
                                  Image.asset(nurse.image, fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            bottom: screenheight / 66,
                            right: screenwidth / 115,
                            child: Container(
                              width: screenwidth / 25,
                              height: screenheight / 50,
                              decoration: BoxDecoration(
                                color: nurse.isOnline
                                    ? Colors.green
                                    : Colors.orange,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: screenwidth / 196),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenwidth/30),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nurse.name,
                              style: TextStyle(fontFamily: 'poppins',
                        fontSize: screenwidth * 0.03,
                        color: AppColors.blackColor1,)
                            ),
                            Text(
                              nurse.specialty,
                              style: TextStyle(fontFamily: 'poppins',
                        fontSize: screenwidth * 0.03,
                        color: AppColors.grayColor3,)
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                     trailing: CustomRadioButton(
                    value: nurse.name,
                    groupValue: selectedNurse,
                    onChanged: (value) {
                      setState(() {
                        selectedNurse = value;
                      });
                    },
                  ),
                 
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenheight *0.02),
            child: OutlinedButton(
              onPressed: () {
                if (selectedNurse != null) {
                  Navigator.pop(context, selectedNurse);
                }
              },
              child: Text('Select Nurse',
                  style:TextStyle(fontFamily: 'poppins',
                        fontSize: screenwidth * 0.04,
                        color: AppColors.whiteColor1,)),
              style:  ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),),
                    side: BorderSide(
                      color: AppColors.primaryColor, 
                      width: 2,
                    ), 
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(screenwidth * 0.97, screenheight * 0.06), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class CustomRadioButton extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        width: MediaQuery.of(context).size.width/16,
        height: MediaQuery.of(context).size.height/34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300, 
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width/28,
            height: MediaQuery.of(context).size.height/58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.primaryColor : Colors.grey.shade400, 
            ),
          ),
        ),
      ),
    );
  }
}