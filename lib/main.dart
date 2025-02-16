import 'package:flutter/material.dart';
import 'package:shiftly/core/routing/app_router.dart';
import 'package:shiftly/core/styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return MaterialApp.router(
      theme: AppTheme.theme,
      title: 'shiftly',
      routerConfig: router.config(),
    );
  }
}
