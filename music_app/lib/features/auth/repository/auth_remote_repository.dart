import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/user/signup"),
      headers: {
        'Content-Type': 'application/json', // Set the content type
      },
      body: jsonEncode(
        {
          'username': name,
          'email': email,
          'password': password,
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/login"),
      headers: {},
      body: {
        'username': email,
        'password': password,
      },
    );
    print(response.statusCode);
    print(response.body);
  }
}
