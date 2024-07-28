import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/features/auth/view/screens/signUp_screen.dart';
import 'package:music_app/features/auth/viewmodel/auth_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(authViewModelProvider.notifier).initSharedPreferences();
  final user = await container.read(authViewModelProvider.notifier).getData();
  print(user);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: const SignupScreen(),
    );
  }
}
