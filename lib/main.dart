import 'package:appwrite_toturial/features/auth/view/signup_view.dart';
import 'package:flutter/material.dart';

import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone',
      theme: AppTheme.theme,
      home: const SignUpView(),
    );
  }
}
