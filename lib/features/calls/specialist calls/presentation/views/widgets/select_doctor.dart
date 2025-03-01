// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:instant_project/core/utils/app_assets.dart';
// // import 'package:instant_project/core/utils/app_colors.dart';
// // import 'package:instant_project/core/utils/text_styles.dart';
// // import 'package:instant_project/features/calls/specialist%20calls/data/models/doctor_model.dart';
// // import 'package:instant_project/core/components/custom_button.dart';
// // import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/custom_radio_button.dart';

// // class SelectDoctor extends StatefulWidget {
// //   const SelectDoctor({super.key});

// //   @override
// //   _SelectDoctorState createState() => _SelectDoctorState();
// // }

// // class _SelectDoctorState extends State<SelectDoctor> {
// //   String? selectedDoctor;
// //   TextEditingController searchController = TextEditingController();
// //   List<DoctorModel> doctors = [];
// //   List<DoctorModel> filteredDoctors = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     doctors = [
// //       DoctorModel(
// //           firstName: 'Dr. Salma Ahmed',
// //           type: 'Specialist - Doctor',
// //           image: AppAssets.doc1,
// //           isOnline: true,
// //           id: 2
// //           ),
// //       DoctorModel(
// //           firstName: 'Dr. Helmy Fadl',
// //           type: 'Specialist - Doctor',
// //           image: AppAssets.doc2,
// //           isOnline: true,
// //           id: 2,
// //         ),
// //       DoctorModel(
// //           firstName: 'Dr. Shawki Haleem',
// //           type: 'Specialist - Doctor',
// //           image: AppAssets.doc3,
// //           isOnline: true,
// //         id: 2,  
// //         ),
// //       DoctorModel(
// //           firstName: 'Dr. Islam Mahmoud',
// //           type: 'Specialist - Doctor',
// //           image: AppAssets.doc4,
// //           isOnline: true,
// //           id: 2,
// //           ),
// //       DoctorModel(
// //           firstName: 'Dr. Ali Ahmed',
// //           type: 'Specialist - Doctor',
// //           image: AppAssets.doc5,
// //           isOnline: false,
// //           id: 2,
// //           ),
// //       DoctorModel(
// //           firstName: 'Dr. Hend Ali',
// //           type: 'Specialist - Doctor',
// //           image: AppAssets.doc6,
// //           isOnline: false,
// //           id: 2,
// //           ),
// //     ];
// //     filteredDoctors = doctors;
// //   }

// //   void _filterDoctors(String query) {
// //     setState(() {
// //       if (query.isEmpty) {
// //         filteredDoctors = doctors;
// //       } else {
// //         filteredDoctors = doctors
// //             .where((doctor) =>
// //                 doctor.firstName.toLowerCase().contains(query.toLowerCase()) ||
// //                 doctor.type.toLowerCase().contains(query.toLowerCase()))
// //             .toList();
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final double height = MediaQuery.of(context).size.height;
// //     final double width = MediaQuery.of(context).size.width;
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         title: Text(
// //           "Select Doctor",
// //           style: TextStyles.stylePoppinsRegular16PageTitle
// //               .copyWith(fontSize: 22.sp),
// //         ),
// //         centerTitle: true,
// //         automaticallyImplyLeading: false,
// //         leading: IconButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //             },
// //             icon: const Icon(Icons.close)),
// //       ),
// //       body: Column(
// //         children: [
// //           // Search Bar
// //           Padding(
// //             padding: EdgeInsets.all(height / 100),
// //             child: TextField(
// //               controller: searchController,
// //               onChanged: _filterDoctors,
// //               decoration: InputDecoration(
// //                 hintText: "Search for doctors",
// //                 hintStyle: TextStyles.stylePoppinsRegular14Hint,
// //                 prefixIcon: const Icon(Icons.search),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(height / 80),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           // Doctor List
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: filteredDoctors.length,
// //               itemBuilder: (context, index) {
// //                 DoctorModel doctor = filteredDoctors[index];

// //                 return ListTile(
// //                   contentPadding: EdgeInsets.symmetric(
// //                       horizontal: width / 25,
// //                       vertical: height / 200), // Adjust spacing
// //                   title: Row(
// //                     children: [
// //                       Stack(
// //                         children: [
// //                           Container(
// //                             height: height / 12,
// //                             width: width / 6,
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(height / 67),
// //                             ),
// //                             child: ClipRRect(
// //                               borderRadius: BorderRadius.circular(height / 67),
// //                               child:
// //                                   Image.asset(doctor.image, fit: BoxFit.cover),
// //                             ),
// //                           ),
// //                           Positioned(
// //                             bottom: height / 66,
// //                             right: width / 115,
// //                             child: Container(
// //                               width: width / 25,
// //                               height: height / 50,
// //                               decoration: BoxDecoration(
// //                                 color: //doctor.isOnline
// //                                      Colors.green,
// //                                     //: Colors.orange,
// //                                 shape: BoxShape.circle,
// //                                 border: Border.all(
// //                                     color: Colors.white, width: width / 196),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(width: width / 33),
// //                       Expanded(
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               doctor.firstName,
// //                               style: TextStyles.stylePoppinsMedium14Title
// //                                   .copyWith(fontSize: 16.sp),
// //                             ),
// //                             Text(
// //                               doctor.type,
// //                               style: TextStyles.stylePoppinsRegular12Subtitle
// //                                   .copyWith(fontSize: 14.sp),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   trailing: CustomRadioButton(
// //                     value: doctor.firstName,
// //                     groupValue: selectedDoctor,
// //                     onChanged: (value) {
// //                       setState(() {
// //                         selectedDoctor = value;
// //                       });
// //                     },
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: EdgeInsets.all(height / 50),
// //             child: CustomButton(
// //               onPressed: () {
// //                 if (selectedDoctor != null) {
// //                   Navigator.pop(context, selectedDoctor);
// //                 }
// //               },
// //               buttonBody: Text('Select Doctor',
// //                   style: TextStyles.stylePoppinsRegular14Hint
// //                       .copyWith(color: Colors.white, fontSize: 16.sp)),
// //               width: double.infinity,
// //               color: AppColors.primaryColor,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/specialist%20calls/cubits/Get%20All%20Doctors%20Cubit/get_all_doctors_cubit.dart';
import 'package:instant_project/features/calls/specialist%20calls/cubits/Get%20All%20Doctors%20Cubit/get_all_doctors_state.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/doctor_model.dart';
import 'package:instant_project/core/components/custom_button.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/custom_radio_button.dart';

// class SelectDoctor extends StatefulWidget {
//   const SelectDoctor({super.key});

//   @override
//   _SelectDoctorState createState() => _SelectDoctorState();
// }

// class _SelectDoctorState extends State<SelectDoctor> {
//   String? selectedDoctor;
//   TextEditingController searchController = TextEditingController();
//   List<DoctorModel> doctors = [];
//   List<DoctorModel> filteredDoctors = [];

//    void initState() {
//     super.initState();
//     context.read<GetAllDoctorsCubit>().getAllDoctors();
//     filteredDoctors = doctors;
//   }

//   void _filterDoctors(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         filteredDoctors = doctors;
//       } else {
//         filteredDoctors = doctors
//             .where((doctor) =>
//                 doctor.firstName.toLowerCase().contains(query.toLowerCase()) ||
//                 doctor.type.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     final double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Select Doctor",
//           style: TextStyles.stylePoppinsRegular16PageTitle
//               .copyWith(fontSize: 22.sp),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.close)),
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: EdgeInsets.all(height / 100),
//             child: TextField(
//               controller: searchController,
//               onChanged: _filterDoctors,
//               decoration: InputDecoration(
//                 hintText: "Search for doctors",
//                 hintStyle: TextStyles.stylePoppinsRegular14Hint,
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(height / 80),
//                 ),
//               ),
//             ),
//           ),
//           // Doctor List
//           BlocBuilder<GetAllDoctorsCubit, GetAllDoctorssState>(
//             builder: (context, state) {
//               if(state is GetAllDoctorsLoading){
//                 return const Center(child: CircularProgressIndicator(),);
//               }else if(state is GetAllDoctorsLoaded){
//                 doctors = state.doctors;
//                 filteredDoctors = doctors;
//                 print('doctors List in select doctor $doctors');
//               return Expanded(
//                       child: ListView.builder(
//                         itemCount: filteredDoctors.length,
//                         itemBuilder: (context, index) {
//                           DoctorModel doctor = filteredDoctors[index];
          
//                           return ListTile(
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: width / 25,
//                                 vertical: height / 200), // Adjust spacing
//                             title: Row(
//                               children: [
//                                 Stack(
//                                   children: [
//                                     Container(
//                                       height: height / 12,
//                                       width: width / 6,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(height / 67),
//                                       ),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(height / 67),
//                                         child:
//                                             Image.asset(AppAssets.doc1, fit: BoxFit.cover),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       bottom: height / 66,
//                                       right: width / 115,
//                                       child: Container(
//                                         width: width / 25,
//                                         height: height / 50,
//                                         decoration: BoxDecoration(
//                                           color: Colors.green,
                                              
//                                           shape: BoxShape.circle,
//                                           border: Border.all(
//                                               color: Colors.white, width: width / 196),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(width: width / 33),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         doctor.firstName,
//                                         style: TextStyles.stylePoppinsMedium14Title
//                                             .copyWith(fontSize: 16.sp),
//                                       ),
//                                       Text(
//                                         doctor.type,
//                                         style: TextStyles.stylePoppinsRegular12Subtitle
//                                             .copyWith(fontSize: 14.sp),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             trailing: CustomRadioButton(
//                               value: doctor.firstName,
//                               groupValue: selectedDoctor,
//                               onChanged: (value) {
//                                 setState(() {
//                                   selectedDoctor = value;
//                                 });
//                               },
//                             ),
//                           );
//                         },
//                       ),
//                     );
//             }else if(state is GetAllDoctorsErorr){
//               return Text(state.errorMessage);
//             }else{
//               return const SizedBox();
//             }
//             }
//           ),
//           Padding(
//             padding: EdgeInsets.all(height / 50),
//             child: CustomButton(
//               onPressed: () {
//                 if (selectedDoctor != null) {
//                   Navigator.pop(context, selectedDoctor);
//                 }
//               },
//               buttonBody: Text('Select Doctor',
//                   style: TextStyles.stylePoppinsRegular14Hint
//                       .copyWith(color: Colors.white, fontSize: 16.sp)),
//               width: double.infinity,
//               color: AppColors.primaryColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SelectDoctor extends StatefulWidget {
  const SelectDoctor({super.key});

  @override
  _SelectDoctorState createState() => _SelectDoctorState();
}

class _SelectDoctorState extends State<SelectDoctor> {
  String? selectedDoctor;
  final TextEditingController searchController = TextEditingController();
  List<DoctorModel> doctors = [];
  List<DoctorModel> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    context.read<GetAllDoctorsCubit>().getAllDoctors();
  }

  // ✅ Updated filter logic
  void _filterDoctors(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDoctors = doctors; // Restore full list when query is empty
      } else {
        filteredDoctors = doctors
            .where((doctor) =>
                doctor.firstName.toLowerCase().contains(query.toLowerCase()) ||
                doctor.type.toLowerCase().contains(query.toLowerCase()))
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
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
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
          BlocBuilder<GetAllDoctorsCubit, GetAllDoctorssState>(
            builder: (context, state) {
              if (state is GetAllDoctorsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetAllDoctorsLoaded) {
                // ✅ Update doctors and filteredDoctors once when loaded
                if (doctors.isEmpty) {
                  doctors = state.doctors;
                  filteredDoctors = doctors;
                }

                return Expanded(
                  child: filteredDoctors.isEmpty
                      ? const Center(child: Text("No doctors found."))
                      : ListView.builder(
                          itemCount: filteredDoctors.length,
                          itemBuilder: (context, index) {
                            final doctor = filteredDoctors[index];

                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: width / 25,
                                vertical: height / 200,
                              ),
                              title: Row(
                                children: [
                                  // Doctor Image with Online Indicator
                                  Stack(
                                    children: [
                                      Container(
                                        height: height / 12,
                                        width: width / 6,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(height / 67),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(height / 67),
                                          child: Image.asset(AppAssets.doc1,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: height / 66,
                                        right: width / 115,
                                        child: Container(
                                          width: width / 25,
                                          height: height / 50,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: width / 196,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: width / 33),
                                  // Doctor Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doctor.firstName,
                                          style: TextStyles
                                              .stylePoppinsMedium14Title
                                              .copyWith(fontSize: 16.sp),
                                        ),
                                        Text(
                                          doctor.type,
                                          style: TextStyles
                                              .stylePoppinsRegular12Subtitle
                                              .copyWith(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              trailing: CustomRadioButton(
                                value: doctor.firstName,
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
                );
              } else if (state is GetAllDoctorsErorr) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const SizedBox();
              }
            },
          ),
          // Select Button
          Padding(
            padding: EdgeInsets.all(height / 50),
            child: CustomButton(
              onPressed: () {
                if (selectedDoctor != null) {
                  Navigator.pop(context, selectedDoctor);
                }
              },
              buttonBody: Text(
                'Select Doctor',
                style: TextStyles.stylePoppinsRegular14Hint.copyWith(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              width: double.infinity,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
