import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:instant_project/core/network/dio_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthRepository {
 
  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
    DioManager.instance.setToken(token);
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      Response response = await DioManager.instance.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        UserModel user = UserModel.fromJson(response.data);
        if (user.token != null) {
          await _saveToken(user.token!);
          print("user's token ${user.token}");
        }
        return user;
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Login error: $e');
      throw Exception('Login failed');
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
