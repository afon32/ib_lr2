import 'dart:convert';

import 'package:flutter_ib/auth/registration/model/registration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final registrationRepositoryProvider = Provider<RegistrationRepository>((ref) {
  return RegistrationRepository.instance;
});

class RegistrationRepository {
  RegistrationRepository._();

  static final RegistrationRepository instance = RegistrationRepository._();

  Future<String> register(RegistrationData data) async {
    final response = await http.post(
      Uri.http('192.168.0.188:5000', '/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Ошибка регистрации: ${response.body}');
    } else {
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('token', response.body);
    }
    print(response.body);
    return response.body;
  }
}
