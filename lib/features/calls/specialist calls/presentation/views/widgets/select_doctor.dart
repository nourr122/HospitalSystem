import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/doctor_model.dart';
import 'package:instant_project/core/components/custom_button.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/custom_radio_button.dart';

class SelectDoctor extends StatefulWidget {
  const SelectDoctor({super.key});

  @override
  _SelectDoctorState createState() => _SelectDoctorState();
}

class _SelectDoctorState extends State<SelectDoctor> {
  String? selectedDoctor;
  TextEditingController searchController = TextEditingController();
  List<DoctorModel> doctors = [];
  List<DoctorModel> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    doctors = [
      DoctorModel(
          name: 'Dr. Salma Ahmed',
          specialty: 'Specialist - Doctor',
          image: AppAssets.doc1,
          isOnline: true),
      DoctorModel(
          name: 'Dr. Helmy Fadl',
          specialty: 'Specialist - Doctor',
          image: AppAssets.doc2,
          isOnline: true),
      DoctorModel(
          name: 'Dr. Shawki Haleem',
          specialty: 'Specialist - Doctor',
          image: AppAssets.doc3,
          isOnline: true),
      DoctorModel(
          name: 'Dr. Islam Mahmoud',
          specialty: 'Specialist - Doctor',
          image: AppAssets.doc4,
          isOnline: true),
      DoctorModel(
          name: 'Dr. Ali Ahmed',
          specialty: 'Specialist - Doctor',
          image: AppAssets.doc5,
          isOnline: false),
      DoctorModel(
          name: 'Dr. Hend Ali',
          specialty: 'Specialist - Doctor',
          image: AppAssets.doc6,
          isOnline: false),
    ];
    filteredDoctors = doctors;
  }

  void _filterDoctors(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDoctors = doctors;
      } else {
        filteredDoctors = doctors
            .where((doctor) =>
                doctor.name.toLowerCase().contains(query.toLowerCase()) ||
                doctor.specialty.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Select Doctor",
          style: TextStyles.stylePoppinsRegular16PageTitle
              .copyWith(fontSize: 22.sp),
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
          // Search Bar
          Padding(
            padding: EdgeInsets.all(height / 100),
            child: TextField(
              controller: searchController,
              onChanged: _filterDoctors,
              decoration: InputDecoration(
                hintText: "Search for doctors",
                hintStyle: TextStyles.stylePoppinsRegular14Hint,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(height / 80),
                ),
              ),
            ),
          ),
          // Doctor List
          Expanded(
            child: ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                DoctorModel doctor = filteredDoctors[index];

                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: width / 25,
                      vertical: height / 200), // Adjust spacing
                  title: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: height / 12,
                            width: width / 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(height / 67),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(height / 67),
                              child:
                                  Image.asset(doctor.image, fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            bottom: height / 66,
                            right: width / 115,
                            child: Container(
                              width: width / 25,
                              height: height / 50,
                              decoration: BoxDecoration(
                                color: doctor.isOnline
                                    ? Colors.green
                                    : Colors.orange,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: width / 196),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: width / 33),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.name,
                              style: TextStyles.stylePoppinsMedium14Title
                                  .copyWith(fontSize: 16.sp),
                            ),
                            Text(
                              doctor.specialty,
                              style: TextStyles.stylePoppinsRegular12Subtitle
                                  .copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: CustomRadioButton(
                    value: doctor.name,
                    groupValue: selectedDoctor,
                    onChanged: (value) {
                      setState(() {
                        selectedDoctor = value;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(height / 50),
            child: CustomButton(
              onPressed: () {
                if (selectedDoctor != null) {
                  Navigator.pop(context, selectedDoctor);
                }
              },
              buttonBody: Text('Select Doctor',
                  style: TextStyles.stylePoppinsRegular14Hint
                      .copyWith(color: Colors.white, fontSize: 16.sp)),
              width: double.infinity,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
