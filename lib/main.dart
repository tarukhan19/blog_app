import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/features/auth/presentation/screens/screen_signin.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/supabase_secrets.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
 final supaBase =  await Supabase.initialize(url: AppSecrets.SUPA_BASE_URL, anonKey: AppSecrets.SUPA_BASE_ANNON_KEY);

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
