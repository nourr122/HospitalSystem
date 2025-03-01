import 'dart:developer';

import 'package:instant_project/features/calls/helper.dart';
import 'package:instant_project/features/calls/constants.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/Card_model.dart';

// Future<List<CardModel>> displayAllCalls()async{
//     List<CardModel> data = await Api().get(
//       url: getCallsApi, 
//       token: receptionistToken);
     
//     return data;

//   }
// Future<List<CardModel>> displayAllCallsDoctors() async {
//   final response = await Api().get(
//     url: callsApi,
//     token: doctorToken,
//   );

//   if (response['message'] == "Success Request" && response['data'] is List) {
//     return (response['data'] as List)
//         .map((call) => CardModel.fromJson(call))
//         .toList();
//   } else {
//     throw Exception('Error: ${response['message']}');
//   }
// }

Future<List<CardModel>> displayAllCallsDoctors() async {
  log('displayAllCallsDoctors called');

  final response = await Api().get(
    url: callsApi,
    token: doctorToken,
  );

  if (response['message'] == "Success Request" && response['data'] is List) {
    return (response['data'] as List)
        .map((call) => CardModel.fromJson(call))
        .toList();
  } else {
    throw Exception('Error: ${response['message']}');
  }
}