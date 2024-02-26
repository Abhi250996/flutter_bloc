import 'dart:convert';

import 'package:bloc_demo/Model/user.dart';
import 'package:http/http.dart';

class UserApi2 {
  static const String baseUrl = 'https://reqres.in/api/users';

  static Future<User> getUser(int userId) async {
// Replace with your actual API endpoint and authentication (if applicable)
    final url = Uri.parse('$baseUrl/$userId');
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to fetch user: ${response.statusCode}');
    }
  }
}


class UserApi {
  static const String baseUrl = 'https://reqres.in/api/users';

  static Future<User> getUser(String email, String password) async {

    int userId =10;
// Replace with your actual API endpoint and authentication (if applicable)
    final url = Uri.parse('$baseUrl/$userId');
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to fetch user: ${response.statusCode}');
    }
  }
}
