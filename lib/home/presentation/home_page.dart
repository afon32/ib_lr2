import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ib/auth/auth/presentation/login_page.dart';
import 'package:flutter_ib/home/data/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final protectedService = ref.watch(protectedRepositoryProvider);

    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
          onPressed: () {
            try {
              // Сохраняем токен и переходим в приложение
              final message = protectedService.protected();
              print(message);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ошибка: $e')),
              );
            }
          },
          child: Text('protected')),
      ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage(),
                ));
          },
          child: Text('Выйти'))
    ])));
  }
}
