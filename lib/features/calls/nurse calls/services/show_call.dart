import 'package:instant_project/features/calls/constants.dart';
import 'package:instant_project/features/calls/doctor%20calls/data/models/call_details_model.dart';
import 'package:instant_project/features/calls/helper.dart';

// Future<List<dynamic>> showCall({required String id})async{
//     List<dynamic> data = await Api().get(
//       url:'$getCallsApi/$id', 
//       token: receptionistToken);
//     return data;
//   }

Future <CallDetailsModel> showCallsDetailsNurse({required int id}) async {
  final response = await Api().get(
    url: '$callsApi/$id',
    token: nurseToken,
  );

  if (response['message'] == "Success Request" ) {
    return CallDetailsModel.fromJson(response['data']) ;
  } else {
    throw Exception('Error: ${response['message']}');
  }
}