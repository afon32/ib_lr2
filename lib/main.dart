import 'package:flutter/material.dart';
import 'package:flutter_ib/auth/registration/presentation/registration_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth/auth/presentation/login_page.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
