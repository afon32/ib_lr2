import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ib/auth/auth/data/repository.dart';
import 'package:flutter_ib/auth/registration/presentation/registration_page.dart';
import 'package:flutter_ib/home/presentation/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/state.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(loginFormProvider);
    final authService = ref.read(loginRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Авторизация')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) =>
                  ref.read(loginFormProvider.notifier).updateEmail(value),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Пароль'),
              obscureText: true,
              onChanged: (value) =>
                  ref.read(loginFormProvider.notifier).updatePassword(value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const RegistrationPage(),
                      ));
                },
                child: Text('Регистрация')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final token = await authService.login(formState);
                  // Сохраняем токен и переходим в приложение
                  print('Успешная авторизация. Токен: $token');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage(),
                      ));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ошибка: $e')),
                  );
                }
              },
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
