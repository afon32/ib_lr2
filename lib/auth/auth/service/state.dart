// Провайдер состояния формы
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/login.dart';

final loginFormProvider =
    StateNotifierProvider<LoginFormNotifier, LoginData>((ref) {
  return LoginFormNotifier();
});

class LoginFormNotifier extends StateNotifier<LoginData> {
  LoginFormNotifier() : super(LoginData(email: '', password: ''));

  void updateEmail(String email) {
    state = LoginData(email: email, password: state.password);
  }

  void updatePassword(String password) {
    state = LoginData(email: state.email, password: password);
  }
}
