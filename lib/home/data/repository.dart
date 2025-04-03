import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

final protectedRepositoryProvider = Provider<ProtectedRepository>((ref) {
  return ProtectedRepository.instance;
});

class ProtectedRepository {
  ProtectedRepository._();

  static final ProtectedRepository instance = ProtectedRepository._();

  Future<String> protected() async {
    final prefs = await SharedPreferences.getInstance();
    final token = (prefs.getString('token'))!.trim();

    final response = await http.get(
      Uri.http('192.168.0.188:5000', '/protected'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      print(response.body);
      // throw Exception('Ошибка авторизации: ${response.body}');
    } else if (response.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = (prefs.getString('refreshToken'))!.trim();

      final response = await http.get(
        Uri.http('192.168.0.188:5000', '/get_access'),
        headers: {'Authorization': 'Bearer $refreshToken'},
      );
      final responseData = json.decode(response.body);
      final token = responseData['token'] as String;

      prefs.setString('token', token);

      return await protected();
    }
    return response.body; // Возвращаем токен
  }
}
