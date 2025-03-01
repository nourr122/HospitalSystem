import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instant_project/features/calls/constants.dart';
import 'package:instant_project/features/calls/helper.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/create_call_model.dart';

// class PostCreateCallService {
//   Future<CreateCallModel> addCall(
//       {
//       required String patientName,
//       required String doctorId,
//       required String description,
//       required String phone,
//       required String age}) async {
//     Map<String, dynamic> data = await Api().post(
//       url: callsApi,
//       body: ({
//         'patient_name': patientName,
//         'doctor_id': doctorId,
//         'age': age,
//         'phone': phone,
//         'description': description
//       }),
//        token: receptionistToken,
//     );
//     return CreateCallModel.fromJson(data);
//   }
// }

// class PostCreateCallService {
//   Future<CreateCallModel> addCall({
//     required String patientName,
//     required String doctorId,
//     required String description,
//     required String phone,
//     required String age,
//     required BuildContext context, // Add BuildContext here
//   }) async {
//     final Map<String, dynamic> body = {
//       'patient_name': patientName,
//       'doctor_id': doctorId,
//       'age': age,
//       'phone': phone,
//       'description': description,
//     };

//     try {
//       final data = await Api().post(
//         url: callsApi,
//         body: body,
//         token: receptionistToken,
//         context: context, // Pass context here
//       );
//       return CreateCallModel.fromJson(data);
//     } catch (e) {
//       rethrow; // Keep propagating the error if needed
//     }
//   }
// }

class PostCreateCallService {
  Future<void> addCall({
    required String patientName,
    required String doctorId,
    required String description,
    required String phone,
    required String age,
    required BuildContext context,
  }) async {
    final Map<String, dynamic> body = {
      'patient_name': patientName,
      'doctor_id': doctorId,
      'age': age,
      'phone': phone,
      'description': description,
    };

    try {
      log('Sending POST request: $body');
      final response = await Api().post(
        url: callsApi,
        body: body,
        token: receptionistToken, 
        context: context,
      );

      // Display Snackbar with the response message
      final String message = response['message'] ?? 'Unknown response';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      log('POST Successful: $message');
    } catch (e) {
      log('POST Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Request failed: $e')),
      );
    }
  }
}

