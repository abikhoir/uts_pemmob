import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'providers/quiz_provider.dart';
import 'themes/app_theme.dart'; // Impor file app_theme.dart


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: MaterialApp(
        title: 'MI Quiz App',
        theme: AppTheme.getTheme(false), // Gunakan tema light dari AppTheme
        darkTheme: AppTheme.getTheme(true), // Gunakan tema dark dari AppTheme
        debugShowCheckedModeBanner: false, // Nonaktifkan banner DEBUG
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/quiz': (context) => const QuizScreen(),
          '/result': (context) => const ResultScreen(),
        },
      ),
    );
  }
}
