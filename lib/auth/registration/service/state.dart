import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/registration.dart';

// Провайдер для управления состоянием формы
final registrationFormProvider =
    StateNotifierProvider<RegistrationFormNotifier, RegistrationData>(
  (ref) => RegistrationFormNotifier(),
);

class RegistrationFormNotifier extends StateNotifier<RegistrationData> {
  RegistrationFormNotifier()
      : super(RegistrationData(name: '', email: '', password: ''));

  // Обновляем имя
  void updateName(String name) {
    state = RegistrationData(
        name: name, email: state.email, password: state.password);
  }

  // Обновляем email
  void updateEmail(String email) {
    state = RegistrationData(
        name: state.name, email: email, password: state.password);
  }

  // Обновляем пароль
  void updatePassword(String password) {
    state = RegistrationData(
        name: state.name, email: state.email, password: password);
  }
}
