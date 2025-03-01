import 'dart:developer';

import 'package:instant_project/features/calls/constants.dart';
import 'package:instant_project/features/calls/helper.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/doctor_model.dart';

// Future<List<DoctorModel>> displayDoctors() async {
//   final response = await Api().get(
//     url: getDoctors,
//     token: receptionistToken,
//   );
//     log('API response doctors: $response');

//   if (response['message'] == "Success Request" && response['data'] is List) {
//     return (response['data'] as List)
//         .map((doctor) => DoctorModel.fromJson(doctor))
//         .toList();
//   } else {
//     throw Exception('Error: ${response['message']}');
//   }
// }
// Future<List<DoctorModel>> displayDoctors() async {
//   log('displayDoctors() called');

//   final response = await Api().get(
//     url: getDoctors,
//     token: receptionistToken,
//   );

//   log('API response: $response');

//   if (response['message'] == "Success Request" && response['data'] is List) {
//     return (response['data'] as List)
//         .map((doctor) => DoctorModel.fromJson(doctor))
//         .toList();
//   } else {
//     throw Exception('Error: ${response['message']}');
//   }
// }

Future<List<DoctorModel>> displayDoctors() async {
  log('Calling API to fetch doctors...');
  try {
    final response = await Api().get(
      url: getDoctors,
      token: receptionistToken,
    );
    log('API Response: $response');

    if (response['message'] == "Success Request" && response['data'] is List) {
      return (response['data'] as List)
          .map((doctor) => DoctorModel.fromJson(doctor))
          .toList();
    } else {
      log('Invalid API Response: $response');
      throw Exception('Invalid response format');
    }
  } catch (e) {
    log('API Error: $e');
    rethrow; // Re-throw the error for Cubit to catch
  }
}
