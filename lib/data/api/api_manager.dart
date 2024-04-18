import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:g_p_app/data/api/api_constants.dart';
import 'package:g_p_app/data/model/request/login_request.dart';
import 'package:g_p_app/data/model/response/login_response.dart';

class ApiManager{

  static final Dio _dio = Dio();

  static Future<LoginResponse?> login(String email, String password) async {
    try {
      var loginBody = LoginRequest(email: email, password: password);
      final response = await _dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.loginApi}',
        data: loginBody.toJson(), // Remove the curly braces and comma
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        var loginResponse = LoginResponse.fromJson(response.data);
        return loginResponse;
      } else {
        return LoginResponse(message: response.statusMessage);
      }
    } catch (error) {
      // Handle errors
      return LoginResponse(message: error.toString()); // Return null to indicate login failure
    }
  }
}