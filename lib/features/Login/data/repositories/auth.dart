import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://hospital.elhossiny.net/api/v1',
    ),
  );
  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '/login',
        data: jsonEncode({'email': email, 'password': password}),
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
