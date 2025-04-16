// lib/utils/constants.dart
class AppConstants {
  // Routes
  static const String homeRoute = '/';
  static const String quizRoute = '/quiz';
  static const String resultRoute = '/result';

  // Quiz Settings
  static const int totalQuestions = 10;
  static const int timePerQuestion = 30; // in seconds

  // Categories
  static const List<String> categories = [
    'Pengenalan Program Studi',
    'Teknologi Informasi',
    'Manajemen',
    'Pemrograman',
    'Database',
    'Sistem Informasi'
  ];

  // App Info
  static const String appName = 'MI Quiz App';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Aplikasi Quiz untuk Mahasiswa D4 Manajemen Informatika';

  // Validation Messages
  static const String errorNoAnswerSelected = 'Silakan pilih jawaban terlebih dahulu';
  static const String errorQuizNotStarted = 'Quiz belum dimulai';
  static const String errorQuizAlreadyCompleted = 'Quiz sudah selesai';
}