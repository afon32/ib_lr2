import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login.dart';
import 'package:http/http.dart' as http;

final loginRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository.instance;
});

class AuthRepository {
  AuthRepository._();

  static final AuthRepository instance = AuthRepository._();

  Future<String> login(LoginData data) async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');

    final response = await http.post(
      Uri.http('192.168.0.188:5000', '/login'),
      // headers: {'Authorization': 'Bearer $token'},
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'] as String;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);

      // throw Exception('Ошибка авторизации: ${response.body}');
    }
    return response.body; // Возвращаем токен
  }
}
