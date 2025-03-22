import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/features/auth/presentation/screens/screen_signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Blogs",
      theme: AppTheme.darkThemeMode,
      home: const SignInScreen(),
    );
  }
}
