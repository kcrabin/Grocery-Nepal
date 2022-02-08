import 'dart:convert';

import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/login_request.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  static Future<void> login(
      {required String username, required String password}) async {
    final url = baseUrl + "users/login/";
    final request = jsonEncode(
      LoginRequest(username: username, password: password).toJson(),
    );
    final response = await http.post(
      Uri.parse(url),
      body: request,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
    } else if (response.statusCode == 401) {
      throw Exception('Invalid credentials');
    } else {
      throw Exception('Unable to login');
    }
  }
}
