import 'package:flutter/material.dart';
import 'package:client/features/atuh/view/pages/signup_page.dart';
import 'package:client/features/atuh/view/pages/login_page.dart';
import './core/theme/thema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: LoginPage(),
    );
  }
}
