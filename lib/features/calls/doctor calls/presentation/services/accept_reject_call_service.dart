// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:instant_project/features/calls/constants.dart';
// import 'package:instant_project/features/calls/helper.dart';

// class AcceptRejectCallService {
//   Future<void> putService({
//     required String status,
//     required BuildContext context,
//     required int id,
//     required String token
//   }) async {
//     final Map<String, dynamic> body = {
//       'status': status,
//     };

//     try {
//       log('Sending Put request: $body');
//       final response = await Api().put(
//         url: '$acceptRejectApi/$id',
//         body: body,
//         token: token, 
//         context: context,
//       );

//       // Display Snackbar with the response message
//       final String message = response['message'] ?? 'Unknown response';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(message)),
//       );

//       log('Put Successful: $message');
//     } catch (e) {
//       log('POST Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Request failed: $e')),
//       );
//     }
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instant_project/features/calls/constants.dart';
import 'package:instant_project/features/calls/helper.dart';

class AcceptRejectCallService {
  Future<void> putService({
    required String status,
    required BuildContext context,
    required int id,
    required String token
  }) async {
    final Map<String, dynamic> body = {
      'status': status,
    };

    try {
      log('Sending Put request: $body');
      final response = await Api().put(
        url: '$acceptRejectApi/$id',
        body: body,
        token: token, 
        context: context,
      );

      // Display Snackbar with the response message
      final String message = response['message'] ?? 'Unknown response';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      log('Put Successful: $message');
    } catch (e) {
      log('POST Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Request failed: $e')),
      );
    }
  }
}

