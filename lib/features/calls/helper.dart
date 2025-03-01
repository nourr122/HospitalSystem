import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio dio = Dio();

  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      log('Requesting URL: $url');
      log('Headers: $headers');

      Response response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      log('Response: ${response.data}');

      if (response.data['message'] == "Success Request") {
        return response.data;
      } else {
        throw Exception('Error: ${response.data['message']}');
      }
    } catch (e) {
      log('Error: $e');
      rethrow; 
    }
  }


  

  // post request --> [add]
 Future<dynamic> post({
    required String url,
    required dynamic body,
    required String? token,
    required BuildContext context,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await dio.post(
        url,
        options: Options(headers: headers),
        data: body, 
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.data['message'] ?? 'Request completed')),
      );

      if (response.data['message'] == "Success Request") {
        return response.data;
      } else {
        throw Exception('Error: ${response.data['message']}');
      }
    } catch (e) {
      // Show error message in Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );

      throw Exception('Error: $e');
    }
  }

  
Future <dynamic> put({
  required String url, 
  @required dynamic body, 
  @required String? token,
  required BuildContext context
  }) async{
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if(token != null){
      headers.addAll({'Authorization':'Bearer $token'});
    }
    Response response = await dio.put(
      url, 
      options: Options(headers: headers),
      data: body, 
    );
   ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.data['message'] ?? 'Request completed')),
      );
    try { 
      if (response.data['message'] == "Success Request") {
        return response.data;
      } else {
        throw Exception('Error: ${response.data['message']}');
      }}
     catch (e) {
      // Show error message in Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );

      throw Exception('Error: $e');
    }
  }
}

 