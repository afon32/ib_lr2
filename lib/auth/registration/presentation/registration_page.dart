import 'package:flutter/material.dart';
import 'package:flutter_ib/auth/registration/model/registration.dart';
import 'package:flutter_ib/auth/registration/service/service.dart';
import 'package:flutter_ib/auth/registration/service/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationPage extends ConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(registrationFormProvider);
    final registrationService = ref.read(registrationServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Имя'),
              onChanged: (value) {
                ref.read(registrationFormProvider.notifier).updateName(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                ref.read(registrationFormProvider.notifier).updateEmail(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Пароль'),
              obscureText: true,
              onChanged: (value) {
                ref.read(registrationFormProvider.notifier).updatePassword(value);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Авторизация'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Используем текущее состояние формы
                  final result = await registrationService.register(formState);
                  print(result);

                  // Показываем сообщение об успехе
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Регистрация успешна!')),
                  );

                  // Очищаем форму после успешной регистрации
                  ref.read(registrationFormProvider.notifier)
                    ..updateName('')
                    ..updateEmail('')
                    ..updatePassword('');

                } catch (e) {
                  // Показываем сообщение об ошибке
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ошибка регистрации: $e')),
                  );
                }
              },
              child: const Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}